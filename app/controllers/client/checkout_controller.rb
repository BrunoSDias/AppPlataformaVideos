class Client::CheckoutController < Client::ApplicationController
  skip_before_action :authorize, only: :order_status
  skip_before_action :verify_authenticity_token, only: :order_status

  def index
    @course = Sales::Course.find(params[:course_id])
  end

  def create_intent
    if params[:sales_seller_id]
      @seller = Sales::Seller.find(params[:sales_seller_id])
      amount = (params[:amount] * 100).to_i
      fee = amount * 12 / 100

      payment_intent = Stripe::PaymentIntent.create({
        payment_method_types: ['card', 'boleto'],
        amount: amount,
        currency: 'brl',
        application_fee_amount: fee,
        transfer_data: {
          destination: @seller.stripe_account_id,
        },
      })

      render json: { clientSecret: payment_intent['client_secret'], amount: amount, fee: fee }, status: :ok
    end
  end

  def create_order
    amount = params[:amount].to_i / 100
    fee = params[:fee].to_i / 100
    descounted_value = amount - fee

    course = Sales::Course.find(params[:sales_course_id])
    order = Sales::Order.new
    order.client_user_id = @user
    order.sales_course_id = course.id
    order.payment_intent_id = params[:payment_intent_id]
    order.data_expiracao = Time.at(params[:expires_at]) if params[:expires_at]
    order.pdf_boleto = params[:pdf]
    order.valor_total = amount
    order.valor_liquido = descounted_value
    order.taxa = fee
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
