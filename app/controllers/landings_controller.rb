class LandingsController < ApplicationController
  def index
    session[:usertype] = nil
  end

  def usertype_auth
    session[:usertype] = params[:usertype].to_s.downcase

    if valid_usertype?
      redirect_to invoices_path
    else
      redirect_to root_url
    end
  end
end
