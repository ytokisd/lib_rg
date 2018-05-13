require "yaml"
class Utils
  attr_accessor :file_path

  def initialize(file_path)
    @path = file_path
  end

  def load_file
    a = YAML.load_file @path
  end

  def write_file(destination)
    file = File.open(destination, 'w')
    file.write(load_file.to_yaml)    
    file.close
  end
  
end