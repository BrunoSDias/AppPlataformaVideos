class Marketplace::CheckoutController < Marketplace::ApplicationController
  def index
    @course = Sales::Course.find(params[:course_id])
  end

  def create_intent
    payment_intent = Stripe::PaymentIntent.create(
      amount: (params[:amount] * 100).to_i,
      currency: 'brl'
    )

    render json: { clientSecret: payment_intent['client_secret'] }, status: :ok
  end
end
