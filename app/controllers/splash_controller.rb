class SplashController < ApplicationController
  before_action :check_signed_in
  before_action :authenticate_user!, except: [:index]

  def check_signed_in
    redirect_to groups_path if signed_in?
  end
end
