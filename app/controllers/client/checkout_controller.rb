class Client::CheckoutController < Client::ApplicationController
  skip_before_action :authorize, only: :order_status
  skip_before_action :verify_authenticity_token, only: :order_status

  def index
    @course = Sales::Course.find(params[:course_id])
  end

  def create_intent
    payment_intent = Stripe::PaymentIntent.create(
      amount: (params[:amount] * 100).to_i,
      currency: 'brl',
      payment_method_types: ['card', 'boleto']
    )

    render json: { clientSecret: payment_intent['client_secret'] }, status: :ok
  end

  def create_order
    course = Sales::Course.find(params[:sales_course_id])
    order = Sales::Order.new
    order.client_user_id = @user
    order.sales_course_id = course.id
    order.payment_intent_id = params[:payment_intent_id]
    order.data_expiracao = Time.at(params[:expires_at]) if params[:expires_at]
    order.pdf_boleto = params[:pdf]
    order.valor_total = course.preco
    order.numero_boleto = params[:number]
    order.status = params[:status] == "succeeded" ? 2 : 1
    order.tipo_pagamento = order.numero_boleto ? 'boleto' : 'cartao'
    if order.save!
      render json: { ok: true }, status: :ok
      return
    end
    render json: {}, status: :unauthorized
  end

  def order_status
    begin
      event = Stripe::Event.construct_from(params.as_json)
    rescue JSON::ParserError => e
      # Invalid payload
      puts "⚠️  Webhook error while parsing basic request. #{e.message})"
      status 400
      return
    end

    case event.type
    when 'payment_intent.succeeded'
      payment_intent = event.data.object
      order = Sales::Order.find_by(payment_intent_id: payment_intent.id)
      order.update(status: 2) if order
      render json: {}, status: :ok
    end
  end
end
