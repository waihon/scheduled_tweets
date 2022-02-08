class User < ApplicationRecord
  has_many :twitter_accounts
  has_many :tweets, dependent: :destroy

  # email:string
  # password_digest:string
  #
  # password:string virtual
  # password_confirmation:string virtual
  has_secure_password

  validates :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP,
                              message: "must be a valid mail address" }
end
