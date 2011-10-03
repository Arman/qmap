module ApplicationHelper
  
  # Return a title on a per-page basis.
  def title
    base_title = "Qmap"
    if @subtitle.nil?
      base_title
    else
      "#{base_title} | #{@subtitle}"
    end
  end
  
end
