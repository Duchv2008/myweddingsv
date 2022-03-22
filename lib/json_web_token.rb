class JsonWebToken
  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS256')
  end

  def self.decode(token)
    decoded = JWT.decode token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' }
    # Pass to has
    return nil if decoded.length == 0
    return HashWithIndifferentAccess.new decoded[0]
  end
end