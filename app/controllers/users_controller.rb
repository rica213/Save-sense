class UsersController < ApplicationController
  # Simple page with the name of the app, and links to the sign up and log in pages
  def splash
    return unless user_signed_in?

    redirect_to categories_path
  end
end
