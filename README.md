# QA Automation Challenge (Ruby)

This project is a solution to the **QA Automation Challenge**. It monitors an API, logs request results into a local SQLite database, calculates uptime, and helps identify a bug in name validation.

## 📦 Setup

### 1. Clone or unzip the project

If you downloaded the `.zip`:

```bash
unzip qa_automation_challenge_ruby.zip
cd qa_automation_challenge_ruby
```

### 2. Install dependencies

Ensure Ruby is installed, then:

```bash
gem install bundler
bundle install
```

## 🚀 Scripts

### `monitor_api.rb`
Sends 1 request/second to the API and logs:
- URL
- name sent
- response status
- response text
- timestamp

```bash
ruby monitor_api.rb
```

Let it run for **10+ minutes** to capture a meaningful dataset.

---

### `calculate_uptime.rb`
Reads `request_logs.db` and calculates the uptime based on percentage of requests with status `200`.

```bash
ruby calculate_uptime.rb
```

---

### `find_bug.rb`
Finds failed requests in the database and prints them to help detect the input bug related to name formatting.

```bash
ruby find_bug.rb
```

---

## 📁 Files

| File                | Description                                 |
|---------------------|---------------------------------------------|
| `monitor_api.rb`    | Logs API response data into SQLite          |
| `calculate_uptime.rb` | Calculates and prints the service uptime   |
| `find_bug.rb`       | Helps identify the bug in name handling     |
| `request_logs.db`   | The SQLite database storing request logs    |
| `Gemfile`           | Dependency declarations (`httparty`, `sqlite3`) |
| `README.md`         | You're reading it!                          |

---

## ✅ Deliverable

- Commit the `request_logs.db` file after running the monitor script
- Push the project to a **private GitHub repository**
- Share it with `@conanbatt`

---

## 💡 Notes

- Ruby was used as a bonus.
- Database is persistent and all scripts are runnable independently.
