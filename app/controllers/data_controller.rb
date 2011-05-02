class DataController < ApplicationController
  def show
    @path = 'data|'+params[:id]

    @data = []
    Event.all.each do |e|
      js_time = e['created_at'].to_i*1000
      val = @path.split('|').inject(e) { |obj,item| obj[item.to_s] || break }
      @data << [js_time, val]
    end

    render :json => @data 

  end
end
