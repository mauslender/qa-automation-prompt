# QA Automation Challenge (Ruby)

## Overview
This Ruby project monitors the uptime of a public API by sending periodic POST requests and storing the responses in a SQLite database for analysis.

## The Bug
**Description**:  
The API returns a `500 Internal Server Error` when the `name` field in the POST request exceeds **29 characters** in length.

**Steps to Reproduce**:
1. Open a terminal.
2. Run the following command with any name longer than 29 characters:  
   ```bash
   curl -X POST https://qa-challenge-nine.vercel.app/api/name-checker -d "name=your_long_name_here"


**Expected result**:
{"name":"[name_with_more_than_29_characters]"}

**Actual result**:
{"message":"Unexpected server error"}

## Uptime
Uptime Monitoring
To ensure an accurate uptime calculation, the monitoring script was updated to avoid sending names longer than 29 characters, which would otherwise introduce false negatives due to the bug.

Uptime Results (after 10 minutes):

Total Requests: 721

Successful Requests: 589

Uptime: 81.69%