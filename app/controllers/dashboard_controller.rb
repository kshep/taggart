class DashboardController < ApplicationController
  
  before_filter :authenticate_user!

  def view
    @title = "Test"
  end
end
