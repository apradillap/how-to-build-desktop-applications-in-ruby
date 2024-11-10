require 'glimmer-dsl-libui'

class Address
  ATTRIBUTES = [:name, :street, :city, :state, :zip]
  
  attr_accessor *ATTRIBUTES
  
  def summary
    ATTRIBUTES.map(&method(:send)).compact.reject(&:empty?).join(', ')
  end
end

class User
  attr_accessor :addresses
  
  def initialize
    @addresses = 2.times.map { Address.new }
  end
end

class AddressFormApp
  include Glimmer

  def initialize
    @user = User.new
    @user.addresses[0].name = 'John Doe'
    @user.addresses[0].street = '123 Main St.'
    @user.addresses[0].city = 'San Diego'
    @user.addresses[0].state = 'California'
    @user.addresses[0].zip = '92108'
    @user.addresses[1].name = 'Johnny Doe'
    @user.addresses[1].street = '2000 Main St.'
    @user.addresses[1].city = 'San Diego'
    @user.addresses[1].state = 'CA'
    @user.addresses[1].zip = '92109'
    create_window
  end
  
  def create_window
    @window = window('Address Form with Nested Indexed Data-Binding') { |main_window|
      content_size 400, 200
      margined true
      
      vertical_box {
        label('1) Shipping Address') {
          stretchy false
        }
        address_form(@user, 0)
        label('2) Billing Address') {
          stretchy false
        }
        address_form(@user, 1)
      }
    }
  end
  
  def launch
    @window.show
  end
  
  def address_form(user, address_index)
    vertical_box {
      form {
        Address::ATTRIBUTES.each do |attribute|
          entry {
            label attribute.to_s.capitalize
            puts "Data-Binding entry text to user.#{"addresses[#{address_index}].#{attribute}"}"
            text <=> [user, "addresses[#{address_index}].#{attribute}"]
          }
        end
                
        label {
          stretchy false
          
          text <= [user, "addresses[#{address_index}].summary",
                   computed_by: Address::ATTRIBUTES.map { |attribute| "addresses[#{address_index}].#{attribute}" }
                  ]
        }
      }
    }
  end
end

address_form_app = AddressFormApp.new
address_form_app.launch
