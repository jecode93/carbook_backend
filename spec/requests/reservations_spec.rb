require 'swagger_helper'

describe 'Reservations API' do
  path '/display_reservation' do
    get 'Displays a list of reservations' do
      produces 'application/json'
      response '200', 'successful' do
        run_test!
      end
    end
  end

  path '/reserve' do
    post 'Creates a reservation' do
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          # Add reservation attributes here
          city: { type: :string },
          date: { type: :date },
          user_id: { type: :bigint },
          bike_id: { type: :bigint }
        },
        required: %w[city date user_id bike_id] # Adjust required attributes
      }
      response '201', 'created' do
        run_test!
      end
    end
  end
end
