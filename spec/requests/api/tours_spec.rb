require 'swagger_helper'
include JsonWebToken

describe 'Tours API' do
    path '/tours' do
        post 'create new tour' do
            tags 'tours'
            consumes 'application/json'
            produces 'application/json'
            security [ bearerAuth: [] ]   
            parameter name: :tour, in: :body, schema: {
                type: :object,
                properties: {
                    name: {type: :string},
                    image: {type: :string},
                    city: {type: :string},
                    description: {type: :string},
                    price: {type: :decimal},
                    duration: {type: :decimal}
                },
                required: ["name", "city", "price"]
            } 
            response '201', 'Tour successfully created' do
                    let(:Authorization) {"Bearer #{jwt_encode(user_id: User.last.id)}"}
                    let(:tour){{
                        name: "Great wall of china",
                        image: "",
                        city: "China",
                        description: "cool place",
                        price: 200.5,
                        duration: 50
                    }}
                    run_test!
            end
        end

        get 'grab all tours' do
            tags 'tours'
            consumes 'application/json'
            produces 'application/json'
            security [ bearerAuth: [] ] 
            response '200', 'Tours successfully grabbed' do
                let(:Authorization) {"Bearer #{jwt_encode(user_id: User.last.id)}"}
                schema type: :array,
                    items: {
                        type: :object,
                       properties: { 
                            name: {type: :string},
                            image: {type: :string},
                            city: {type: :string},
                            description: {type: :string},
                            price: {type: :decimal},
                            duration: {type: :decimal}
                    },
                    required: ["name", "city", "price"]
            }      
                run_test!
            end
        end
    end
end