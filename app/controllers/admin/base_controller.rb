class Admin::BaseController < ApplicationController
  before_action :authenticate_admin!

  # layoutの指定
  layout 'admin'
end
