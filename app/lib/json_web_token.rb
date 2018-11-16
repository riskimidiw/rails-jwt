class JsonWebToken
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    begin
      decoded_token = JWT.decode(token, SECRET_KEY)[0]
    rescue Exception => e
      return e.full_message
    end
    HashWithIndifferentAccess.new decoded_token
  end
end