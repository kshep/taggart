class DashboardController < ApplicationController
  
  before_filter :authenticate_user!

  def view

    @title = "Test"

    if current_user.graphs.empty?
      @graph = Graph.new
      @graph.start_at = 3.days.ago - 7.hours  # TODO Fix this hardcoded time zone hack
      @graph.end_at   = Time.now.strftime('%m/%d/%Y %H:%M')
    else
      @graph = current_user.graphs.first
    end

  end
end
