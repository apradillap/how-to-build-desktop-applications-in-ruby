require 'glimmer-dsl-libui'

include Glimmer

window('Option Selector') {
  content_size 50, 20
  margined true
  
  vertical_box {
    @selected_options_label = label('None')
    
    horizontal_box {
      @checkboxes = 3.times.map do |n|
        checkbox("Option #{n+1}") {
          on_toggled do
            puts "Checkbox '#{@checkboxes[n].text}' checked property changed to: #{@checkboxes[n].checked?}"
            checked_checkboxes = @checkboxes.select(&:checked?)
            if checked_checkboxes.empty?
              @selected_options_label.text = 'None'
            else
              @selected_options_label.text = checked_checkboxes.map(&:text).join(', ')
            end
          end
        }
      end
    }
  }
}.show
