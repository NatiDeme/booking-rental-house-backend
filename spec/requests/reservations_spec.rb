require 'swagger_helper'

require './app/controllers/concerns/json_web_token'

describe 'Reservation API' do
  path '/reserve' do
    post 'create new reservation' do
      tags 'reservations'
      consumes 'application/json'
      produces 'application/json'
      security [bearerAuth: []]
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          date: { type: :string },
          tour_id: { type: :integer }
        }
      }
      response '201', 'Reservation successfully created' do
        let(:Authorization) { "Bearer #{jwt_encode(user_id: User.last.id)}" }
        let(:reservation) do
          {
            date: Date.new(2022, 11, 1),
            tour_id: Tour.create(name: 'Great wall of china', image: '', city: 'China',
                                 description: 'cool place', price: 200.5, duration: 50, user_id: User.last.id).id
          }
        end
        run_test!
      end
    end
  end

  path '/user_reservations' do
    get 'grab all reservations' do
      tags 'reservations'
      consumes 'application/json'
      produces 'application/json'
      security [bearerAuth: []]
      response '200', 'Reservations successfully grabbed' do
        let(:Authorization) { "Bearer #{jwt_encode(user_id: User.last.id)}" }
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   tour: { type: :object },
                   date: { type: :string },
                   reservation_id: { type: :integer }
                 }
               }
        run_test!
      end
    end
  end

  path '/user_reservations/{id}' do
    get 'retrieve a reservation' do
      tags 'reservations'
      produces 'application/json'
      security [bearerAuth: []]
      parameter name: :id, in: :path, type: :string
      response '200', 'Reservation successfully retrieved' do
        let(:Authorization) { "Bearer #{jwt_encode(user_id: User.last.id)}" }
        schema type: :object,
               properties: {
                 tour: { type: :object },
                 date: { type: :date },
                 reservation_id: { type: :integer }
               }
        let(:id) do
          Reservation.create(date: Date.new(2022, 11, 1),
                             tours_id: Tour.create(name: 'Great wall of china', image: '', city: 'China',
                                                   description: 'cool place', price: 200.5, duration: 50, user_id: User.last.id).id,
                             user_id: User.last.id).id
        end
        run_test!
      end
    end

    delete 'remove reservation' do
      tags 'reservations'
      produces 'application/json'
      security [bearerAuth: []]
      parameter name: :id, in: :path, type: :string
      response '200', 'Reservation deleted' do
        let(:Authorization) { "Bearer #{jwt_encode(user_id: User.last.id)}" }
        let(:id) do
          Reservation.create(date: Date.new(2022, 11, 1),
                             tours_id: Tour.create(name: 'Great wall of china', image: '', city: 'China',
                                                   description: 'cool place', price: 200.5, duration: 50, user_id: User.last.id).id,
                             user_id: User.last.id).id
        end
        run_test!
      end
    end
  end
end
