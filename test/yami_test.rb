require File.join(File.dirname(__FILE__), *%w(helper))

class YamiTest < Test::Unit::TestCase
  
  def setup
    FakeFS.activate!
    path = File.join(
      File.dirname(__FILE__), 'test.yaml'
    )
    File.open(path, "w") { |f| YAML::dump({},f) }    
    Yami.file = path
  end
  
  def teardown
    FakeFS::FileSystem.clear
    FakeFS.deactivate!
  end
  
  def test_should_read_and_write_value
    Yami[:foo] = "bar"
    assert_equal "bar", Yami[:foo]
  end
  
  def test_should_read_value_with_default
    assert_equal 10, Yami[:zoo, 10]
  end

end