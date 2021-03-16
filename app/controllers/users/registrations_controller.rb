require "#{Rails.root}/lib/error_formatter"
require "#{Rails.root}/lib/success_formatter"

class Users::RegistrationsController < Devise::RegistrationsController

  def create
    result = RegistrationService.new.register(sign_up_params)
    raise result.errors unless result.success?

    render SuccessFormatter.call(result.value)
  rescue StandardError => e
    render ErrorFormatter.call(e)
  end

  private

  def sign_up_params
    params.permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end
end