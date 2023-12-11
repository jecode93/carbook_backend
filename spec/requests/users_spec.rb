require 'swagger_helper'

describe 'Users API' do
  path '/signup' do
    post 'Creates a user (signup)' do
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          # Add user attributes here
          username: { type: :string }
        },
        required: ['username'] # Adjust required attributes
      }
      response '201', 'created' do
        run_test!
      end
    end
  end
end
