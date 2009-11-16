# Yami

Key-Value configuration from a yaml store

# Install
    > sudo gem install Yami
    
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
    
    