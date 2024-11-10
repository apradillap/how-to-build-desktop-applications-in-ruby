require 'glimmer-dsl-libui'

include Glimmer

def update_address_summary
  address_summary = [@name_entry.text, @street_entry.text, @city_entry.text, @state_entry.text, @zip_entry.text].reject(&:empty?).join(', ')
  address_summary += ' (Billing & Shipping)' if @billing_and_shipping_checkbox.checked?
  @summary_label.text = address_summary
end

window('Address Form') {
  content_size 500, 20
  margined true
  
  form {
    @name_entry = entry {
      label 'Name'
      
      on_changed do
        update_address_summary
      end
    }
    
    @street_entry = entry {
      label 'Street'
      
      on_changed do
        update_address_summary
      end
    }
    
    @city_entry = entry {
      label 'City'
      
      on_changed do
        update_address_summary
      end
    }
    
    @state_entry = entry {
      label 'State'
      
      on_changed do
        update_address_summary
      end
    }
    
    @zip_entry = entry {
      label 'Zip'
      
      on_changed do
        update_address_summary
      end
    }
    
    @billing_and_shipping_checkbox = checkbox('Billing & Shipping') {
      on_toggled do
        update_address_summary
      end
    }
    
    @summary_label = label
  }
}.show
