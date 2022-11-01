require 'swagger_helper'
include JsonWebToken

describe 'Reservation API' do
    path '/user_reservation' do
        post 'create new reservation' do
            tags 'reservations'
            consumes 'application/json'
            produces 'application/json'
            security [ bearerAuth: [] ]   
            parameter name: :reservation, in: :body, schema: {
                type: :object,
                properties: {
                    date: {type: :string},
                    image: {type: :string},
                    city: {type: :string},
                    description: {type: :string},
                    price: {type: :float},
                    duration: {type: :float}
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

    path '/tours/{id}' do
        get 'retrieve a tour' do
            tags 'tours'
            produces 'application/json'
            security [ bearerAuth: [] ] 
            parameter name: :id, in: :path, type: :string
            response '200', 'Tour successfully retrieved' do
                let(:Authorization) {"Bearer #{jwt_encode(user_id: User.last.id)}"}
                schema type: :object,
                       properties: { 
                            name: {type: :string},
                            image: {type: :string},
                            city: {type: :string},
                            description: {type: :string},
                            price: {type: :decimal},
                            duration: {type: :decimal}
                    }
                let(:id) {Tour.create(name: "Great wall of china",image: "",city: "China",description: "cool place",price: 200.5, duration: 50, user_id: User.last.id).id}
                run_test!
            end
        end
    end
end