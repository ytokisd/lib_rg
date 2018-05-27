require 'yaml'
# Utiliti class is for file processing methods
class Utils
  def initialize(file_path)
    @path = file_path
  end

  def load_file
    YAML.load_file @path
  rescue StandardError => e
    puts "Could not parse YAML: #{e.message}"
  end

  def write_file(destination, library_data)
    file = File.open(destination, 'w')
    file.write(library_data.to_yaml)
    file.close
  end
end
