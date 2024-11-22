# QA Automation Challenge

## Introduction

This challenge is designed to evaluate candidate’s practical understanding of scripting, databases, and monitoring.

We have an API at https://qa-challenge-nine.vercel.app/api/name-checker that processes names.

This API endpoint has two issues you are expected to find and fix.

### Uptime

You are expected to find out what the actual service uptime is as expressed in time (% of time service returns 200) or requests (% of requests that return 200).

To do this, you are expected to build a continuously monitoring script. In this script, you must store each request and the result in a SQLite database.

Second, you are expected to write a second script that reads from this database, calculates the service uptime, and outputs it to the console.

### The Bug

There is a bug in this application pertaining the format of names. The API will return a specific error when this happens - you are expected to find out the pattern of this error.

# Deliverable

### Tips & Tricks

- Bonus points for doing this in Ruby (even if it’s not your main language).
- The Bug is not contrived - it does not require lateral thinking.
- https://qa-challenge-nine.vercel.app/api/name-checker
