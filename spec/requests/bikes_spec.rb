require 'swagger_helper'

describe 'Bikes API' do
  path '/display_bikes' do
    get 'Displays a list of bikes' do
      produces 'application/json'
      response '200', 'successful' do
        run_test!
      end
    end
  end

  path '/create_bikes' do
    post 'Creates a bike' do
      consumes 'application/json'
      parameter name: :bike, in: :body, schema: {
        type: :object,
        properties: {
          # Add bike attributes here
          name: { type: :string },
          image: { type: :string },
          description: { type: :string },
          deposit: { type: :float },
          finance_fee: { type: :float },
          option_to_purchase_fee: { type: :float },
          total_amount_payable: { type: :float },
          duration: { type: :integer },
          user_id: { type: :bigint }
        },
        required: %w[name image description deposit finance_fee option_to_purchase_fee total_amount_payable duration user_id] # Adjust required attributes
      }
      response '201', 'created' do
        run_test!
      end
    end
  end
end
