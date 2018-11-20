module ApplicationHelper


  
   # Adds a message to the relevant flash name array (error, notice or success) 
    #
    # @param [Symbol] flash name
    # @param [String] message
    def flash_message name, msg
      flash[name] ||= []
      flash[name] << msg
  end   

  # Iterates through each flash message in the array and renders it to the DOM with a partial
  #
  # @return [String] HTML elements
  def render_flash partial
      flash_array = []
      flash.each do |name, msg, title|
          if msg.is_a?(String)
            flash_array << render(partial: partial, format: [:html], locals: { name: name, msg: msg, title: title })
          else
              msg.each do |m|
                flash_array << render(partial: partial, format: [:html], locals: { name: name, msg: m, title: title }) unless m.blank?
              end
          end
      end
      flash_array.join('').html_safe
  end
end
