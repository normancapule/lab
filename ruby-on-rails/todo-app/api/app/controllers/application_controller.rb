class ApplicationController < ActionController::API
  rescue_from StandardError do |exception|
    render json: { error: exception.message }, status: :unprocessable_entity
  end
end
