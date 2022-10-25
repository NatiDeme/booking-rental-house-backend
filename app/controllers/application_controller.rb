class ApplicationController < ActionController::API
    before_action :set_default_format
    before_action :authenticate_token!

    private

    def set_default_format
        request.format = :json
    end

    def auth_token
        @auth_token || = request.headers.fetch("Authorization","").split(" ").last
    end
   
    def auauthenticate_token!
        payload = JsonWebToken.decode auth_token
        if payload.present?
            @current_user = User.find(payload["sub"])
        else
            render json: {errors: ["Invalid auth token"]}, status: :unauthorized
        end
    end
    
    
end
