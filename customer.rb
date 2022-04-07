class Customer
  attr_reader :first_name, :last_name, :email, :vehicle_type, :vehicle_name, :vehicle_length

  def initialize(customer_data)
    @first_name = customer_data[:first_name]
    @last_name = customer_data[:last_name]
    @email = customer_data[:email]
    @vehicle_type = customer_data[:vehicle_type]
    @vehicle_name = customer_data[:vehicle_name]
    @vehicle_length = customer_data[:vehicle_length]
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end
end
