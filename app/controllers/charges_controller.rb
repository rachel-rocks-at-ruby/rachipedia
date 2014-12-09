class ChargesController < ApplicationController
  
  def new
  end

  def create
    # Amount in cents
    @amount = 1500
    @user = current_user

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    @user.role = "premium"
    @user.save

    flash[:notice] = "Your account has been upgraded to premium."
    redirect_to wikis_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
