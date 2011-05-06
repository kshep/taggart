class DashboardController < ApplicationController
  
  before_filter :authenticate_user!

  def view
    @title = "Test"
    @graph = current_user.graphs.first
  end
end
