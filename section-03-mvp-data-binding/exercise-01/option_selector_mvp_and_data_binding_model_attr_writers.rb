require 'glimmer-dsl-libui'

class OptionSelectorModel
  attr_accessor :option1, :option2, :option3, :summary
  
  def initialize
    update_summary
  end
  
  def option1=(value)
    @option1 = value
    update_summary
  end
  
  def option2=(value)
    @option2 = value
    update_summary
  end
  
  def option3=(value)
    @option3 = value
    update_summary
  end
  
  private
  
  def update_summary
    selected_options = (1..3).select { |n| send("option#{n}") }
    if selected_options.empty?
      self.summary = 'None'
    else
      self.summary = selected_options.map {|n| "Option #{n}" }.join(', ')
    end
  end
end

class OptionSelectorView
  include Glimmer

  def initialize
    @option_selector_model = OptionSelectorModel.new
    create_gui_body
  end
  
  def create_gui_body
    @window = window('Option Selector') {
      content_size 50, 20
      margined true
      
      vertical_box {
        label {
          text <= [@option_selector_model, :summary]
        }
        
        horizontal_box {
          3.times do |n|
            option_number = n + 1
            checkbox("Option #{option_number}") {
              checked <=> [@option_selector_model, "option#{option_number}"]
            }
          end
        }
      }
    }
  end
  
  def launch
    @window.show
  end
end

option_selector_view = OptionSelectorView.new
option_selector_view.launch
