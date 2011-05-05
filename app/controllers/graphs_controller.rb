class GraphsController < ApplicationController
  def create
    @graph = Graph.new(params[:graph])
    redirect_to root_path, :flash => { :error => "Couldn't save graph for #{current_user.username}" }
  end
end
