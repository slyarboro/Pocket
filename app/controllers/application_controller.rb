class ApplicationController < ActionController::Base
  # Prevent CSRF (Verifies browser of authorized user instead of user itself. Enables a compromised browser to act under guise of user.) attacks by raising an exception.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:index]


  def authorize
     redirect_to login_url, alert: "Not authorized" if current_user.nil?
   end

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user
end
