class Charge < ActiveRecord::Base
  CURRENCIES = ["usd", "gbp", "eur", "inr"]
  belongs_to :customer
  validates_presence_of :amount,  :currency, :customer_id
  validates :currency, :inclusion => CURRENCIES
end
