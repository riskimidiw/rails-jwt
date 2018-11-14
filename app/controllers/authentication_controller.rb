class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  def login

  end

  def logout

  end

end
