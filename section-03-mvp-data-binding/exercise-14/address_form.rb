require 'glimmer-dsl-libui'

class Address
  ATTRIBUTES = [:name, :street, :city, :state, :zip]
  
  attr_accessor *ATTRIBUTES
  
  def summary
    ATTRIBUTES.map(&method(:send)).compact.reject(&:empty?).join(', ')
  end
end

class AddressFormView
  include Glimmer

  def initialize
    @address = Address.new
    create_window
  end
  
  def create_window
    @window = window('Address Form') {
      content_size 400, 200
      margined true
      
      vertical_box {
        form {
          Address::ATTRIBUTES.each do |attribute|
            entry {
              label attribute.to_s.capitalize
              text <=> [@address, attribute]
            }
          end
        }
        
        label {
          stretchy false
          
          text <= [@address, :summary, computed_by: Address::ATTRIBUTES]
        }
      }
    }
  end
  
  def launch
    @window.show
  end
end

address_form_view = AddressFormView.new
address_form_view.launch
