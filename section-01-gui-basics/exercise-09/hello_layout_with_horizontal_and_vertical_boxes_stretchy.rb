require 'glimmer-dsl-libui'

include Glimmer

window('Hello, Layout!') {
  content_size 50, 20
  margined true
  
  vertical_box {
    horizontal_box {
      label('Full Name') {
        stretchy false
      }
      entry {
        text 'John Smith'
      }
    }
    
    horizontal_box {
      label('DOB') {
        stretchy false
      }
      date_picker {
        time year: 2004, mon: 11, mday: 17
      }
    }
  }
}.show
