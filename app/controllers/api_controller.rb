require "#{Rails.root}/lib/json_web_token"

class ApiController < ApplicationController
  before_action :set_default_format
  before_action :authenticate_user!
  
  private
  
  def set_default_format
    request.format = :json
  end
end