require 'json'

class Database
  def initialize
    @folder_path = '../saving_files'
    Dir.mkdir(@folder_path) unless Dir.exist?(@folder_path)
    @file_path = ''
    @file = ''
  end

  def save(data, file_name)
    check_files(file_name)
    json = JSON.parse(@file.read)
    id = json.keys.length + 1
    json[id] = data
    data_json = JSON.generate(json)
    File.write(@file_path, data_json)
    true
  end

  def get_data_from(file_name)
    check(file_name)
    JSON.parse(@file.read).map { |id, data| data.merge({ 'id' => id }) }
  end

  private

  def check(file_name)
    @file_path = "#{@folder_path}/#{file_name}.json"
    File.write(@file_path.to_s, '{}') unless File.exist?(@file_path)
    @file = File.open(@file_path, 'r')
  end
end
