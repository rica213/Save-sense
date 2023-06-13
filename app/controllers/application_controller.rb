class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_navbar_title, :set_toggle_menu, :set_action_link_text, :set_action_link_path,
                unless: :splash_action?
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def set_toggle_menu
    @show_toggle_menu = %w[trades#index categories#index].include?("#{controller_name}##{action_name}")
  end

  def set_navbar_title
    title_mapping = {
      'sessions#new' => 'Login',
      'registrations#new' => 'Register',
      'trades#new' => 'New Trade',
      'trades#index' => 'Trades',
      'trades#show' => 'Trade',
      'categories#new' => 'New Category',
      'categories#index' => 'Categories',
      'categories#show' => 'Details'
    }

    default_title = 'Save Sense'
    key = "#{controller_name}##{action_name}"
    @navbar_title = title_mapping[key] || default_title
  end

  def set_action_link_text
    @action_link_text = case "#{controller_name}##{action_name}"
                        when 'sessions#new'
                          'Log in'
                        when 'registrations#new'
                          'Sign up'
                        else
                          'Sign out'
                        end
  end

  def set_action_link_path
    @action_link_path = if "#{controller_name}##{action_name}" == 'sessions#new'
                          new_user_session_path
                        elsif "#{controller_name}##{action_name}" == 'registrations#new'
                          new_user_registration_path
                        else
                          destroy_user_session_path
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
