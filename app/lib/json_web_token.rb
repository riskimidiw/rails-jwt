class JsonWebToken
  SECRET_KEY = Rails.application.secrets.secret_key_base

  def encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def decode(token)
    begin
      decoded_token = JWT.decode(token, SECRET_KEY)[0]
    rescue Exception => e
      return e.full_message
    end
    HashWithIndifferentAccess decoded_token
  end
end