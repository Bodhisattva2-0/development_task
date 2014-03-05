class ChargesController < ApplicationController
  def index
    @failed_charges = Charge.where({paid: false, refunded: false})
    @disputed_charges = Charge.where({paid: true, refunded: true})
    @successful_charges = Charge.where({paid: true, refunded: false})
  end

  def new
    @customers = Customer.all
    @charge = Charge.new
  end

  def create
    charge = Charge.create(params.require(:charge).permit(:customer_id, :amount, :currency).merge(paid: true, refunded: false))
    if charge.save
      redirect_to charges_path
    else
        flash[:error] = charge.errors.full_messages
         redirect_to new_charge_path
    end
  end
end
