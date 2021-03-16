require "#{Rails.root}/lib/json_web_token"

class SessionService
  Result = Struct.new(:success?, :errors, :value)

  def user_login(params)
    data = {}
    user = User.find_by(email: params[:email])

    raise StandardError.new 'Invalid Password or Username' unless user&.valid_password?(params[:password])

    data[:token] = JsonWebToken.encode(sub: user.id)

    Result.new(true, [], data)
  rescue StandardError => e
    Result.new(false, e, nil)
  end
end