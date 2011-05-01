class EventsController < ApplicationController

  def create

    event = Event.new(:data => params)
    event.save!

    respond_to do |format|
      format.xml  { render :text => 'OK' }
      format.json { render :text => 'OK' }
    end
  end
end
