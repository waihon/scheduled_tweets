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

### 33. Twitter API

* `bundle add twitter`

### 34. Background Job for Posting Tweets"

* `rails g job Tweet`

### 36. Background Jobs with Sidekiq
#### Terminal
* `bundle add sidekiq`
* `brew install redis`
* `brew services start redis` or `/usr/local/opt/redis/bin/redis-server /usr/local/etc/redis.conf`
* `brew info redis`
* `bundle exec sidekiq`

#### Rails Console
* `TweetJob.perform_now(tweet)`

### 38. Deploying to Heroku
#### Terminal
* `bundle lock --add-platform x86_64-linux
* `bundle lock --add-platform ruby
* `rails db:system:change --to=postgresql`
* `rails db:create db:migrate` after changing to PostgreSQL
* `heroku create sched-tweets`
* `git push heroku main`
* `heroku run rails db:migrate`
* `heroku addons:create heroku-redis:hobby-dev`

#### Heroku Dashboard
* After deploying `Profile`, enable `worker` via Heroku dashboard.
* Add a new key named `RAILS_MASTER_KEY` with value equals Twitter API Key.

#### Heroku Rails Console
* `Rails.application.credentials.dig(:twitter, :api_key)`

#### Twitter Developer Portal
* Add a Callback URL for production
