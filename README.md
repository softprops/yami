# Yami

Key-Value configuration from a yaml store

# Install

### [Gemcutter](http://gemcutter.org/)

    > sudo gem install yami
    
# Usage

    require 'yami'
    
    # set path to persistent yaml store
    Yami.file = File.join(
      File.dirname(__FILE__), *%w(path to config.yaml)
    )
    
    # read
    Yami[:option] #=> value
    
    # read with default
    Yami[:flavor, "banana"]
    
    # write
    Yami[:shuttle] = {
      :speed => :fast
    }
    
    # fin.
    
2009 doug tangren (softprops) 