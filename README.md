# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

## Terminal Commands

### 11. Creating the User Model

* `rails g model User email:string password_digest:string`
* `rails db:migrate`

### 12. Validations

* `rails db:migrage:redo` (equivalent to `rollback` followed by `migrate`)
