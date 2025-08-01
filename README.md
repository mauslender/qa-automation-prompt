# QA API Monitoring Challenge

This project monitors a buggy API by sending requests regularly and analyzing failures.

## 🧰 Tech Stack

- Ruby
- SQLite3
- Net::HTTP

## 📂 Files in This Project
| File                  | Purpose                                        |
| --------------------- | ---------------------------------------------- |
| `monitor_api.rb`      | Sends requests and logs responses              |
| `calculate_uptime.rb` | Calculates uptime based on DB entries          |
| `request_logs.db`     | SQLite database of all requests (auto-created) |

## 🛠 Setup Instructions

### 1. Install Ruby

```bash
# Example: Download Ruby 3.2.x with DevKit (adjust version accordingly)
curl -LO https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-3.2.2-1/rubyinstaller-devkit-3.2.2-1-x64.exe

# Run the installer (this will launch Windows GUI installer)
cmd.exe /c rubyinstaller-devkit-3.2.2-1-x64.exe
```

Follow the installation wizard (GUI).

After install, open a new bash or cmd terminal and check:

```bash
ruby --version
gcc --version   # part of DevKit
```

### 2. Install SQLite

```bash
gem install sqlite3
```

### 3. Note

If you encounter issues installing `sqlite3`, do this:

```bash
gem uninstall sqlite3
```

```bash
ridk install
```

✅ Select:
- MSYS2 base installation  
- MSYS2 development toolchain

Then retry:

```bash
gem install sqlite3 --platform=ruby
```

### 3. Run the Monitor

```bash
ruby monitor_api.rb
```

It will generate and log requests into `request_logs.db`.

### 4. Check Uptime

```bash
ruby calculate_uptime.rb
```

## 🧹 Cleanup
To reset the logs:

```bash
rm request_logs.db
```
Then re-run monitor_api.rb to start fresh.

## ✅ Test Cases Covered

- Continuous uptime monitoring (request every 0.5s)
- SQLite database logging
- Graceful handling of errors

## 🧪 Bugs Identified

### 1. System Downtime Pattern
The API returns a 500 error with message "System is down" at specific seconds, consistently:

:01, :12, :23, :34, :45, :56
This suggests the server may run internal checks or maintenance jobs every 11 seconds, starting at :01.

### 2. Name Bug
If a name contains **two or more `'p'` characters**, the API crashes with a 500 error:  
```json
{"message":"Unexpected server error"}
```

This is being avoided in the current monitor by excluding such names.

## 📋 Methodical Testing Scheme

1. **Automated request generation** at a fixed interval.
2. **SQLite database** used for logging every request and its result.
3. Uptime measured by ratio of HTTP 200s over total requests.
4. Filtering of input to bypass known bugs and isolate external causes of failure.

## Uptime Final Findings:

Total Requests: 790
Successful Requests: 725
**Uptime: 91.77%**
