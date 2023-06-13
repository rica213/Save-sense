module ApplicationHelper
  def show_toggle_menu?
    %w[trades#index categories#index].include?("#{controller_name}##{action_name}")
  end
end
