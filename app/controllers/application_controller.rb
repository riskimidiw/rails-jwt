class ApplicationController < ActionController::API

  def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find_by_id(@decoded[:user_id])
    rescue JWT::DecodeError
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
end
