class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twittter_account
end
