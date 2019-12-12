## Overtime App

## Key requirement: company that salaried wmplyees did or did not get overtime each week

## Models
x Post -> date:date rationale:text
x User -> Devise
x AdminUser -> STI

## Features
x Approval Workflow
- SMS Sending -> link to approval or overtime input
x Administrate admin dashboard
- Email summary to managers for approval
x Needs to be documented if employee did not log overtime

## UI:
x Bootstrap -> formatting

## Refactor TODOS:
- Refactor user association integration test in post_spec