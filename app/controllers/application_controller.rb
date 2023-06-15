class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!, :set_navbar_title, :set_toggle_menu, :set_action_link_text, :set_action_link_path,
                unless: :splash_action?
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Handle errors from invalid url
  def handle_routing_error
    flash[:error] = 'Invalid URL'
    redirect_to root_path
  end

  def after_sign_in_path_for(_resource)
    root_path
  end

  protected

  def set_toggle_menu
    @show_toggle_menu = %w[trades#index categories#index].include?("#{controller_name}##{action_name}")
  end

  def set_navbar_title
    title_mapping = {
      'sessions#new' => 'Login',
      'registrations#new' => 'Register',
      'trades#new' => 'New Transaction',
      'trades#index' => 'Transactions',
      'trades#show' => 'Transaction',
      'categories#new' => 'New Category',
      'categories#index' => 'Categories',
      'categories#show' => 'Category Details'
    }

    default_title = 'Save Sense'
    key = "#{controller_name}##{action_name}"
    @navbar_title = title_mapping[key] || default_title
  end

  def set_action_link_text
    @action_link_text = if user_signed_in?
                          'Sign out'
                        elsif "#{controller_name}##{action_name}" == 'sessions#new'
                          'Log in'
                        elsif "#{controller_name}##{action_name}" == 'registrations#new'
                          'Next'
                        end
  end

  def set_action_link_path
    if user_signed_in?
      @action_link_path = destroy_user_session_path
    elsif "#{controller_name}##{action_name}" == 'sessions#new'
      @action_link_path = new_user_session_path
    elsif "#{controller_name}##{action_name}" == 'registrations#new'
      @action_link_path = new_user_registration_path
    end
  end

  def splash_action?
    controller_name == 'users' && action_name == 'splash'
  end

  # customize the parameters that can be submitted during the sign-up process
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
