class GraphsController < ApplicationController

  def create

    @graph = Graph.new

    @graph.user_id            = current_user.id
    @graph.keys               = params[:graph]["keys"]
    @graph.formatted_start_at = params[:graph]["formatted_start_at"]
    @graph.formatted_end_at   = params[:graph]["formatted_end_at"]

    if @graph.save
      flash[:success] = "Graph saved for #{@graph.user.username}"
    else
      flash[:error] = "Couldn't save graph for #{@graph.user.username} (#{params[:graph]})"
    end
    redirect_to root_path
  end

  def update

    @graph = Graph.find(params[:id])

    @graph.keys               = params[:graph][:keys]
    @graph.formatted_start_at = params[:graph][:formatted_start_at]
    @graph.formatted_end_at   = params[:graph][:formatted_end_at]

    if @graph.save
      flash[:success] = "Graph saved for #{@graph.user.username}"
    else
      flash[:error] = "Couldn't save graph for #{@graph.user.username}"
    end
    redirect_to root_path
  end

end
