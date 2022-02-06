class OmniauthCallbacksController < ApplicationController
  def twitter
    twitter_account = Current.user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize
    # first_or_initialize will populate username if such record is not found.
    # Therefore, we don't have to include username in the call to update.
    twitter_account.update(
      name: auth.info.name,
      image: auth.info.image,
      token: auth.credentials.token,
      secret: auth.credentials.secret,
    )

    redirect_to root_path, notice: "Successfully connected your account!"
  end

  def auth
    request.env["omniauth.auth"]
  end
end
