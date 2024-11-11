require 'glimmer-dsl-libui'

class Address
  attr_accessor :full_name, :street, :city, :state, :zip, :billing_and_shipping
  alias billing_and_shipping? billing_and_shipping
  
  def summary
    address_summary = [full_name, street, city, state, zip].compact.reject(&:empty?).join(', ')
    address_summary += ' (Billing & Shipping)' if billing_and_shipping?
    address_summary
  end
end

class AddressFormView
  include Glimmer
  
  def initialize
    @address = Address.new
    create_window
    register_observers
  end
    
  def create_window
    @window = window('Address Form') {
      content_size 500, 20
      margined true
      
      form {
        @full_name_entry = entry {
          label 'Full Name'
          
          on_changed do
            @address.full_name = @full_name_entry.text
          end
        }
        
        @street_entry = entry {
          label 'Street'
          
          on_changed do
            @address.street = @street_entry.text
          end
        }
        
        @city_entry = entry {
          label 'City'
          
          on_changed do
            @address.city = @city_entry.text
          end
        }
        
        @state_entry = entry {
          label 'State'
          
          on_changed do
            @address.state = @state_entry.text
          end
        }
        
        @zip_entry = entry {
          label 'Zip'
          
          on_changed do
            @address.zip = @zip_entry.text
          end
        }
        
        @billing_and_shipping_checkbox = checkbox('Billing & Shipping') {
          on_toggled do
            @address.billing_and_shipping = @billing_and_shipping_checkbox.checked
          end
        }
        
        @summary_label = label
      }
    }
  end
  
  def register_observers
    address_summary_update_observer = lambda do |value|
      @summary_label.text = @address.summary
    end
    observe(@address, :full_name, &address_summary_update_observer)
    observe(@address, :street, &address_summary_update_observer)
    observe(@address, :city, &address_summary_update_observer)
    observe(@address, :state, &address_summary_update_observer)
    observe(@address, :zip, &address_summary_update_observer)
    observe(@address, :billing_and_shipping, &address_summary_update_observer)
  end
  
  def launch
    @window.show
  end
end

@address_form_view = AddressFormView.new
@address_form_view.launch
