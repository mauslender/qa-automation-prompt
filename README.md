# QA Automation Challenge

## Introduction

This challenge is designed to evaluate candidate’s practical understanding of scripting, databases, and monitoring.

We have an API at https://qa-challenge-nine.vercel.app/api/name-checker that processes names.

This API endpoint has two issues you are expected to find and fix.

### Uptime

You are expected to find out what the actual service uptime is as expressed in time (% of time service returns 200) or requests (% of requests that return 200).
To do this, you are expected to build a continuously monitoring script.
In this script, you must log each request into the sqlite database in this project.

Second, you are expected to write a second script that reads from this database, calculates the service uptime, and outputs it to the console.

### The Bug

There is a bug in this application pertaining the format of names. The API will return a specific error when this happens - you are expected to find out the pattern of this error.

## Deliverable
Create a private fork of this respository and send it over to @conanbatt for review.
Please commit the request_logs database as you store data on it.

### Tips & Tricks

- Bonus points for doing this in Ruby (even if it’s not your main language). Otherwise python or Javascript is preferred.
- The Bug is not contrived - it does not require lateral thinking.
- You are welcome to use tooling like Postman, but the deliverable includes scripts.
