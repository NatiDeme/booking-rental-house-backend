require 'swagger_helper'

describe 'Authenticate API' do
    path '/login' do
        post 'Login a user' do
            tags  'users'
            consumes 'application/json'
            produces 'application/json'
            parameter name: :login_param, in: :body, schema: {
                type: :object,
                properties: {
                    username: {type: :string},
                    password: {type: :string}
                },
                required: ['username','password']
            }

            response '200', 'Login successful' do
                schema type: :object,
                properties: {
                    token: { type: :string },
                    user: { 
                        type: :object,
                        properties: {
                            name: {type: :string},
                            user_id: {type: :integer}
                        }
                    },
                }
                user1 = User.create( 
                    name: "name",
                    password: "password",
                    username: "test",
                    email: "test@test.com")    
                let(:login_param) {
                {
                    username: user1.username,
                    password: user1.password
                }
                }
                run_test!
            end
            response '401', 'Login failed' do
                let(:login_param) {
                {
                    username: "",
                    password: ""
                }
                }
                run_test!
            end
        end
    end
end

