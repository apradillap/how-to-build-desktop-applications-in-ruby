require 'glimmer-dsl-libui'

include Glimmer

def update_address_summary
  address_summary = [@name_entry.text, @street_entry.text, @city_entry.text, @state_entry.text, @zip_entry.text].reject(&:empty?).join(', ')
  address_summary += ' (Billing & Shipping)' if @billing_and_shipping_checkbox.checked?
  @summary_label.text = address_summary
end

window('Address Form') {
  content_size 400, 20
  margined true
  
  vertical_box {
    horizontal_box {
      label('Name')
      @name_entry = entry {
        on_changed do
          update_address_summary
        end
      }
    }
    
    horizontal_box {
      label('Street')
      @street_entry = entry {
        on_changed do
          update_address_summary
        end
      }
    }
    
    horizontal_box {
      label('City')
      @city_entry = entry {
        on_changed do
          update_address_summary
        end
      }
    }
    
    horizontal_box {
      label('State')
      @state_entry = entry {
        on_changed do
          update_address_summary
        end
      }
    }
    
    horizontal_box {
      label('Zip')
      @zip_entry = entry {
        on_changed do
          update_address_summary
        end
      }
    }
    
    horizontal_box {
      @billing_and_shipping_checkbox = checkbox('Billing & Shipping') {
        on_toggled do
          update_address_summary
        end
      }
    }
    
    @summary_label = label
  }
}.show
