require './customer'

class CustomerImporter
  VALID_DELIMITERS = %w[, |]
  VALID_FILE_EXTS = %w[.csv .txt]
  VALID_SORT_OPTIONS = %i[full_name vehicle_name]
  EXPECTED_CUSTOMER_ATTRIBUTES = %i[first_name last_name email vehicle_type vehicle_name vehicle_length]

  def initialize(file_name:)
    @file_name = file_name if verify_file(file_name)
    @customers = retrieve_customer_data(@file_name)
  end

  def print_results(sort: :full_name)
    raise InvalidSortError unless VALID_SORT_OPTIONS.include?(sort.to_sym)

    @customers.sort_by! { |customer| customer.send(sort) }

    puts 'Full Name           | Email                    | Vehicle Type | Vehicle Name        | Vehicle Length'
    puts '----------------------------------------------------------------------------------------------------'

    @customers.each do |customer|
      full_name = pad_string(customer.full_name, 20)
      email = pad_string(customer.email, 25)
      type = pad_string(customer.vehicle_type, 13)
      vehicle_name = pad_string(customer.vehicle_name, 20)
      length = pad_string(customer.vehicle_length, 14)
      puts "#{full_name}| #{email}| #{type}| #{vehicle_name}| #{length}"
    end

    return
  end

  private

  def verify_file(file_name)
    raise InvalidFileError unless File::exists?(file_name)
    raise InvalidFileError unless VALID_FILE_EXTS.include?(File.extname(file_name))

    true
  end

  def retrieve_customer_data(file_name)
    all_customers = []

    File.foreach(@file_name) do |row|
      customer = build_customer_from_string(row.chomp)
      all_customers << customer
    end

    all_customers
  end

  def build_customer_from_string(string_data)
    customer_data_array = []
    VALID_DELIMITERS.each do |delimiter|
      if string_data.include?(delimiter)
        customer_data_array = string_data.split(delimiter)
      end
    end

    raise InvalidCustomerDataError if customer_data_array.empty? || customer_data_array.length != EXPECTED_CUSTOMER_ATTRIBUTES.length

    customer_data_hash = {}
    EXPECTED_CUSTOMER_ATTRIBUTES.each_with_index do |label, index|
      customer_data_hash[label] = customer_data_array[index]
    end

    Customer.new(customer_data_hash)
  end

  def pad_string(content, length)
     if content.length > length
      content.slice(0, length)
    else
      content.ljust(length)
    end
  end

  class InvalidCustomerDataError < StandardError; end
  class InvalidFileError < StandardError; end
  class InvalidSortError < StandardError; end
end
