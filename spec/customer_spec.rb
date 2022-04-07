require 'spec_helper'
require './customer'

RSpec.describe Customer do
  context 'with valid customer data' do
    let(:customer_data) { {
      first_name: 'Leslie',
      last_name: 'Knope',
      email: 'leslie.knope@pawnee.gov',
      vehicle_type: 'sailboat',
      vehicle_name: 'Lil Sebastian',
      vehicle_length: '34 ft',
      }
    }
    let(:customer) { Customer.new(customer_data) }

    it { expect(customer.first_name).to eq 'Leslie' }
    it { expect(customer.last_name).to eq 'Knope' }
    it { expect(customer.full_name).to eq 'Leslie Knope' }
    it { expect(customer.email).to eq 'leslie.knope@pawnee.gov' }
    it { expect(customer.vehicle_type).to eq 'sailboat' }
    it { expect(customer.vehicle_name).to eq 'Lil Sebastian' }
    it { expect(customer.vehicle_length).to eq '34 ft' }
  end
end
