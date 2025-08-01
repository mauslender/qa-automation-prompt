require 'net/http'
require 'uri'
require 'sqlite3'

# === CONFIGURATION ===
REQUESTS_PER_SECOND = 4
INTERVAL = 2.0 / REQUESTS_PER_SECOND
API_URL = 'https://qa-challenge-nine.vercel.app/api/name-checker'

# === DATABASE SETUP ===
db = SQLite3::Database.new 'request_logs.db'
db.execute <<-SQL
  CREATE TABLE IF NOT EXISTS request_logs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    url TEXT NOT NULL,
    name_parameter TEXT NOT NULL,
    response_status INTEGER NOT NULL,
    response_text TEXT NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
  );
SQL

# === NAME GENERATOR ===
def generate_random_name
  charset = ('a'..'z').to_a + [' ', ' ', ' ', ' ']
  loop do
    length = rand(1..100)  # No max length restriction, arbitrarily capped at 100 to avoid overly long names
    name = Array.new(length) { charset.sample }.join
    cleaned_name = name.strip.squeeze(' ')
    return cleaned_name if cleaned_name.downcase.count('p') < 2
  end
end

# === MAIN LOOP ===
loop do
  name = generate_random_name

  uri = URI(API_URL)
  req = Net::HTTP::Post.new(uri)
  req.set_form_data({ "name" => name })

  begin
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(req)
    end

    safe_body = response.body.encode('UTF-8', invalid: :replace, undef: :replace, replace: '?')

    db.execute(
      "INSERT INTO request_logs (url, name_parameter, response_status, response_text) VALUES (?, ?, ?, ?)",
      [uri.to_s, name, response.code.to_i, safe_body]
    )

    puts "[#{Time.now}] Sent POST with name='#{name}', Status: #{response.code}, Message: #{safe_body}"

  rescue => e
    db.execute(
      "INSERT INTO request_logs (url, name_parameter, response_status, response_text) VALUES (?, ?, ?, ?)",
      [uri.to_s, name, 0, e.message]
    )
    puts "[#{Time.now}] ERROR sending name='#{name}': #{e.message}"
  end

  sleep INTERVAL
end
