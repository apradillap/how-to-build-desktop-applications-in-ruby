require 'glimmer-dsl-libui'

class Address
  STRING_ATTRIBUTES = [:full_name, :street, :city, :state, :zip]
  ATTRIBUTES = STRING_ATTRIBUTES + [:billing_and_shipping]
  attr_accessor *ATTRIBUTES
  alias billing_and_shipping? billing_and_shipping
  
  def summary
    address_summary = STRING_ATTRIBUTES.map(&method(:send)).compact.reject(&:empty?).join(', ')
    address_summary += ' (Billing & Shipping)' if billing_and_shipping?
    address_summary
  end
end

class AddressFormView
  include Glimmer

  def initialize
    @address = Address.new
    create_gui_body
  end
  
  def create_gui_body
    @window = window('Address Form') {
      content_size 500, 20
      margined true
      
      vertical_box {
        form {
          Address::STRING_ATTRIBUTES.each do |attribute|
            entry {
              label attribute.to_s.split('_').map(&:capitalize).join(' ')
              text <=> [@address, attribute]
            }
          end
          
          checkbox('Billing & Shipping') {
            checked <=> [@address, :billing_and_shipping]
          }
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
