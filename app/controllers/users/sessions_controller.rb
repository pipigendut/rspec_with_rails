require "#{Rails.root}/lib/error_formatter"
require "#{Rails.root}/lib/success_formatter"

class Users::SessionsController < Devise::SessionsController

  def create
    result = SessionService.new.user_login(params)
    raise result.errors unless result.success?

    render SuccessFormatter.call(result.value)
  rescue StandardError => e
    render ErrorFormatter.call(e)
  end

  def destroy
    super
  end
end