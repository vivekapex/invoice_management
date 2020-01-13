class ApplicationController < ActionController::Base
  helper_method :current_usertype, :valid_usertype?

  private

  def current_usertype
    session[:usertype].to_s.downcase
  end

  def valid_usertype?
    %w( internal external ).include? current_usertype
  end

  def require_usertype
    redirect_to root_url if not valid_usertype?
    return true
  end
end
