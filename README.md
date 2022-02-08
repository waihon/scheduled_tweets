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

### 20. Forgot Your Password"

* `rails g mailer Password reset`

### 23. Rails Credentials

* `EDITOR="code --wait" rails credentials:edit --environment=development`

### 24. OmniAuth 2.0 URLs

* `bundle add omniauth-twitter omniauth-rails_csrf_protection`

### 25. Twitter Account Model

* `rails g model TwitterAccount user:belongs_to name username image token secret`
* `rails db:migrate`

### 29. Tweets Index and New Actions

* `rails g model Tweet user:belongs_to twittter_account:belongs_to body:text publish_at:datetime tweet_id:string`
* `rails db:migrate`

### 30 Tweet Validations

* `rails g migration rename_twittter_account_id`
* `rails db:migrate`
