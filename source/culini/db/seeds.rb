#seeding customers
customer_1 = {:first_name => "Dean", :last_name => "Martin", :email => "dean.martin@culini.com"}
customer_2 = {:first_name => "Buddy", :last_name => "Rich", :email => "buddy.rich@culini.com"}
customer_3 = {:first_name => "Miles", :last_name => "Davis", :email => "miles.davis@culini.com"}
customer_4 = {:first_name => "Billie", :last_name => "Holiday", :email => "billie.holiday@culini.com"}

customers = []

[customer_1, customer_2, customer_3, customer_4].each do |customer|
	customers << Customer.create(customer)
       puts "Created #{customers.last.name}"
end

#linking charges

#successfull charges
successful_charge_params = {paid: true, refunded: false, currency: "usd"}
5.times { Charge.create(successful_charge_params.merge({customer_id: customers[0].id, amount: rand(1000)}))}
3.times { Charge.create(successful_charge_params.merge({customer_id: customers[1].id, amount: rand(1000)}))}
1.times { Charge.create(successful_charge_params.merge({customer_id: customers[2].id, amount: rand(1000)}))}
1.times { Charge.create(successful_charge_params.merge({customer_id: customers[3].id, amount: rand(1000)}))}

#failed charges
failed_charge_params = {paid: false, refunded: false, currency: "usd"}
3.times { Charge.create(failed_charge_params.merge({customer_id: customers[2].id, amount: rand(1000)}))}
2.times { Charge.create(failed_charge_params.merge({customer_id: customers[3].id, amount: rand(1000)}))}

#disputed charges
disputed_charge_params = {paid: true, refunded: true, currency: "usd"}
3.times { Charge.create(disputed_charge_params.merge({customer_id: customers[0].id, amount: rand(1000)}))}
2.times { Charge.create(disputed_charge_params.merge({customer_id: customers[1].id, amount: rand(1000)}))}
