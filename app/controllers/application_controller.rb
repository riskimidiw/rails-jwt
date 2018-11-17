class ApplicationController < ActionController::API

  def authorize_request
    header = request.headers['Authorization']
    if !header.nil?
      header = header.split(' ').last
      @decoded_token ||= JsonWebToken.decode(header)
      begin
        @user = User.find(@decoded_token[:id])
      rescue Exception => e
        render json: { errors: 'unauthorized' }, status: :unauthorized
      end
    else
      render json: { errors: 'unauthorized' }, status: :unauthorized
    end
  end
end
