require 'glimmer-dsl-libui'

include Glimmer

window('Hello, Layout!') {
  content_size 50, 20
  margined true
  
  form {
    entry {
      label 'Full Name'
      text 'John Smith'
    }
    
    date_picker {
      label 'DOB'
      time year: 2004, mon: 11, mday: 17
    }
  }
}.show
