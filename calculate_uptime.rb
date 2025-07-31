require 'sqlite3'

DB_FILE = 'request_logs.db'
db = SQLite3::Database.new(DB_FILE)

total = db.get_first_value("SELECT COUNT(*) FROM request_logs").to_f
successful = db.get_first_value("SELECT COUNT(*) FROM request_logs WHERE response_status = 200").to_f

uptime = total > 0 ? (successful / total * 100).round(2) : 0

puts "Total Requests: #{total.to_i}"
puts "Successful Requests: #{successful.to_i}"
puts "Uptime: #{uptime}%"
