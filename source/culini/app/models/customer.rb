class Customer < ActiveRecord::Base
	has_many :charges

  def name
    "#{first_name} #{last_name}"
  end

#not taking in to account exchange rates
  def max_charge
    charges.sort{|charge| charge.amount}.last
  end
end
