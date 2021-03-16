require "#{Rails.root}/lib/error_formatter"

class ApiController < ApplicationController
  rescue_from StandardError, with: :result_error
  before_action :authenticate_user!
  before_action :set_default_format
  
  private
  
  def set_default_format
    request.format = :json
  end

  def result_error(e)
    render ErrorFormatter.call(e)
  end
end