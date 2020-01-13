class ApplicationController < ActionController::Base
  helper_method :current_usertype, :valid_usertype?, :external_user?, :internal_user?

  private

  def current_usertype
    session[:usertype].to_s.downcase
  end

  def external_user?
    current_usertype == 'external'
  end

  def internal_user?
    current_usertype == 'internal'
  end

  def valid_usertype?
    %w( internal external ).include? current_usertype
  end

  def require_usertype
    redirect_to root_url if not valid_usertype?
    return true
  end
end
