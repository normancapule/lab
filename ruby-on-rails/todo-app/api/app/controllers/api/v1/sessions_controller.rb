module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = User.find_by(email: permitted_params[:email])
        if user && user.password == permitted_params[:password]
          session = user.sessions.create
          render json: { token: session.token }
        else
          render json: { error: 'Invalid email / password' }, status: :unprocessable_entity
        end
      end

      def destroy
        session = Session.find_by(token: params[:id])
        if session && session.destroy
          render json: {}
        else
          render json: {}, status: :not_found
        end
      end

      private

      def permitted_params
        params.require(:data).permit(:email, :password)
      end
    end
  end
end
