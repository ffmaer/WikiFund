class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :clean_up

  def clean_up

  end
end
