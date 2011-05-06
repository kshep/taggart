module DashboardHelper
  def list
    event = Event.last || {}
    data = event['data']
  
    keys = current_user.graphs.first.keys.split(/,\s*/)

    if data 
      @result = ""
      @result << "<ul id='treeData'>"
      traverse(data,[],"  ",keys) if data
      @result <<  "</ul>"
      @result
    else
      "No event data found"
    end

  end

  def traverse(e, path, pre, keys)
    e.each do |k,v|
      if v.respond_to?('each')
        @result << "#{pre}<li data='hideCheckbox: true'>#{k}"
        @result << "#{pre}  <ul>"
        traverse(v, path+[k], pre+"    ",keys)
        @result << "#{pre}  </ul>"
        @result << "#{pre}</li>"
      else
        this_key = (path+[k]).compact.join(':')
        selected = keys.include?(this_key) ? 'class = "selected"' : ""
        @result << "#{pre}<li #{selected} id='#{this_key}'>#{k}</li>" if v.is_a?(Numeric)
      end
    end
  end
end
