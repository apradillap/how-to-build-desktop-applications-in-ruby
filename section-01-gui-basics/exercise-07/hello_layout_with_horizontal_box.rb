require 'glimmer-dsl-libui'

include Glimmer

window('Hello, Layout!') {
  content_size 50, 20
  margined true
  
  horizontal_box {
    label('Full Name')
    entry {
      text 'John Smith'
    }
  }
}.show
