class RegistrationService
  Result = Struct.new(:success?, :errors, :value)

  def register(params)
    data = {}
    user = User.new(params)
    raise StandardError.new user.errors if user.errors.present?

    user.save!
    data[:result] = user

    Result.new(true, [], data)
  rescue StandardError => e
    Result.new(false, e, nil)
  end
  
end