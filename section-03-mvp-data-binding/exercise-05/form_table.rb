require 'glimmer-dsl-libui'

Contact = Struct.new(:name, :email, :phone, :city, :state) do
  def valid?
    values.map(&:to_s).any?(&:empty?)
  end
  
  def reset
    self.name = ''
    self.email = ''
    self.phone = ''
    self.city = ''
    self.state = ''
  end
end

class FormTablePresenter
  attr_accessor :contacts, :filter_value, :unfiltered_contacts
  
  def initialize
    @contacts = [
      Contact.new('Lisa Sky', 'lisa@sky.com', '720-523-4329', 'Denver', 'CO'),
      Contact.new('Jordan Biggins', 'jordan@biggins.com', '617-528-5399', 'Boston', 'MA'),
      Contact.new('Mary Glass', 'mary@glass.com', '847-589-8788', 'Elk Grove Village', 'IL'),
      Contact.new('Darren McGrath', 'darren@mcgrath.com', '206-539-9283', 'Seattle', 'WA'),
      Contact.new('Melody Hanheimer', 'melody@hanheimer.com', '213-493-8274', 'Los Angeles', 'CA'),
    ]
  end
  
  def new_contact
    @new_contact ||= Contact.new
  end
  
  def save_contact
    contacts << new_contact.dup # automatically inserts a row into the table due to explicit data-binding
    self.unfiltered_contacts = contacts.dup
    new_contact.reset # automatically clears form fields through explicit data-binding
  end
  
  def filter_table
    self.unfiltered_contacts ||= contacts.dup
    # Unfilter first to remove any previous filters
    self.contacts = unfiltered_contacts.dup # affects table indirectly through explicit data-binding
    # Now, apply filter if entered
    unless filter_value.empty?
      self.contacts = contacts.filter do |contact| # affects table indirectly through explicit data-binding
        contact.members.any? do |attribute|
          contact[attribute].to_s.downcase.include?(filter_value.downcase)
        end
      end
    end
  end
end

class FormTable
  include Glimmer
  
  def initialize
    @presenter = FormTablePresenter.new
  end
  
  def launch
    window('Contacts', 600, 600) {
      margined true
      
      vertical_box {
        form {
          stretchy false
          
          entry {
            label 'Name'
            text <=> [@presenter.new_contact, :name] # bidirectional data-binding between entry text and @presenter.name
          }
          
          entry {
            label 'Email'
            text <=> [@presenter.new_contact, :email]
          }
          
          entry {
            label 'Phone'
            text <=> [@presenter.new_contact, :phone]
          }
          
          entry {
            label 'City'
            text <=> [@presenter.new_contact, :city]
          }
          
          entry {
            label 'State'
            text <=> [@presenter.new_contact, :state]
          }
        }
        
        button('Save Contact') {
          stretchy false
          
          on_clicked do
            if @presenter.new_contact.valid?
              msg_box_error('Validation Error!', 'All fields are required! Please make sure to enter a value for all fields.')
            else
              @presenter.save_contact
            end
          end
        }
        
        search_entry {
          stretchy false
          # bidirectional data-binding of text to @presenter.filter_value, filtering table after writing value to Model
          text <=> [@presenter, :filter_value,
                     after_write: ->(filter_value) { @presenter.filter_table }
                   ]
        }
        
        table {
          text_column('Name')
          text_column('Email')
          text_column('Phone')
          text_column('City')
          text_column('State')
    
          editable true
          cell_rows <=> [@presenter, :contacts] # explicit data-binding to @presenter.contacts Model Array, auto-inferring model attribute names from underscored table column names by convention
        }
      }
    }.show
  end
end

FormTable.new.launch
