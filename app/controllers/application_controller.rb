class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :splash_action?

  protected

  def splash_action?
    controller_name == 'users' && action_name == 'splash'
  end
end
