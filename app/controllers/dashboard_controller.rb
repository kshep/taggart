class DashboardController < ApplicationController
  
  before_filter :authenticate_user!

  def view
    @title = "Test"
    @graph = Graph.new()
  end
end
