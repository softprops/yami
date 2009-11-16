require 'yaml'

module Yami
  extend self
  attr_accessor :file
  
  def [](k, default = nil)
    ensure_read
    @config[k] || default
  end
  
  def []=(k,v)
    ensure_read
    @config[k] = v
    write
  end
  
  def reload!
    read
  end
  
  private
  
  def ensure_read
    raise(
      RuntimeError.new(
        "No file defined. Assign one with Config.file='./foo.yaml'"
      )
    ) unless @file
    read unless @config
  end
  
  def read
    File.open(@file) { |f| @config = YAML::load(f) }
  end
  
  def write
    File.open(@file, 'w+') { |f| YAML::dump(@config, f) }
  end
end