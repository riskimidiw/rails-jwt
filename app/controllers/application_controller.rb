class ApplicationController < ActionController::API

  def authorize_request
    header = request.headers['Authorization']
    if !header.nil?
      header = header.split(' ').last
      @decoded_token ||= JsonWebToken.decode(header)
      @user = User.find(@decoded_token[:id])
    else
      render json: {errors: "unauthorized"}, status: :unauthorized
    end
  end
end
