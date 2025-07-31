require 'sqlite3'

DB_FILE = 'request_logs.db'
db = SQLite3::Database.new(DB_FILE)

errors = db.execute("SELECT name_parameter, response_status, response_text FROM request_logs WHERE response_status != 200")

puts "Found #{errors.size} error responses:\n\n"
errors.each do |name, status, message|
  puts "Name: #{name} | Status: #{status} | Message: #{message}"
end
