module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = User.find_by(email: permitted_params[:email])
        if user && user.password == permitted_params[:password]
          session = user.session.create
          render json: { token: session.token }
        else
          render json: { error: 'Invalid email / password' }, status: :unprocessable_entity
        end
      end

      def destroy
      end

      private

      def permitted_params
        params.permit(:email, :password)
      end
    end
  end
end
