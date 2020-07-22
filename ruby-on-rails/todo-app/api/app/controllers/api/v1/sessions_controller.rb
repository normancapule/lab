module Api
  module V1
    class SessionsController < ApplicationController
      def create
        render json: {}, status: :unprocessable_entity
      end
    end
  end
end
