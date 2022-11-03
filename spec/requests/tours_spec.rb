require 'swagger_helper'
require './app/controllers/concerns/json_web_token'

describe 'Tours API' do
  path '/tours' do
    post 'create new tour' do
      tags 'tours'
      consumes 'application/json'
      produces 'application/json'
      security [bearerAuth: []]
      parameter name: :tour, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          image: { type: :string },
          city: { type: :string },
          description: { type: :string },
          price: { type: :number },
          duration: { type: :number }
        },
        required: %w[name city price]
      }
      response '201', 'Tour successfully created' do
        let(:Authorization) { "Bearer #{jwt_encode(user_id: User.last.id)}" }
        let(:tour) do
          {
            name: 'Great wall of china',
            image: '',
            city: 'China',
            description: 'cool place',
            price: 200.5,
            duration: 50
          }
        end
        run_test!
      end
    end

    get 'grab all tours' do
      tags 'tours'
      consumes 'application/json'
      produces 'application/json'
      security [bearerAuth: []]
      response '200', 'Tours successfully grabbed' do
        let(:Authorization) { "Bearer #{jwt_encode(user_id: User.last.id)}" }
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   name: { type: :string },
                   image: { type: :string },
                   city: { type: :string },
                   description: { type: :string },
                   price: { type: :number },
                   duration: { type: :number }
                 },
                 required: %w[name city price]
               }
        run_test!
      end
    end
  end

  path '/tours/{id}' do
    get 'retrieve a tour' do
      tags 'tours'
      produces 'application/json'
      security [bearerAuth: []]
      parameter name: :id, in: :path, type: :string
      response '200', 'Tour successfully retrieved' do
        let(:Authorization) { "Bearer #{jwt_encode(user_id: User.last.id)}" }
        schema type: :object,
               properties: {
                 name: { type: :string },
                 image: { type: :string },
                 city: { type: :string },
                 description: { type: :string },
                 price: { type: :string },
                 duration: { type: :string }
               }
        let(:id) do
          Tour.create(name: 'Great wall of china', image: '', city: 'China',
                      description: 'cool place', price: 200.5, duration: 50, user_id: User.last.id).id
        end
        run_test!
      end
    end

    delete 'remove tour' do
      tags 'tours'
      produces 'application/json'
      security [bearerAuth: []]
      parameter name: :id, in: :path, type: :string
      response '200', 'Tour deleted' do
        let(:Authorization) { "Bearer #{jwt_encode(user_id: User.last.id)}" }
        let(:id) do
          Tour.create(name: 'Great wall of china', image: '', city: 'China',
                      description: 'cool place', price: 200.5, duration: 50, user_id: User.last.id).id
        end
        run_test!
      end
    end
  end
end
