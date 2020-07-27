module Api
  module V1
    class RegistrationsController
      def create
        user = User.new(permitted_params)
        if user.save
          session = user.session.create
          render json: { token: session.token }
        else
          render json: { error: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def permitted_params
        params.require(:data).permit(:email, :password, :password_confirmation)
      end
    end
  end
end
