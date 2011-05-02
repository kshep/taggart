module DashboardHelper
  def list
    data = Event.all.last['data']
    @result = "<ul id='treeData'>"
    traverse(data,[],"  ")
    @result <<  "</ul>"
    @result
  end

  def traverse(e, path, pre)
    e.each do |k,v|
      if v.respond_to?('each')
        @result << "#{pre}<li data='hideCheckbox: true'>#{k}"
        @result << "#{pre}  <ul>"
        traverse(v, path+[k], pre+"    ")
        @result << "#{pre}  </ul>"
        @result << "#{pre}</li>"
      else
        @result << "#{pre}<li id='#{(path+[k]).compact.join('|')}'>#{k}</li>" if v.is_a?(Numeric)
      end
    end
  end
end
