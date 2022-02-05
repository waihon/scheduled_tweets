class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present?
      # Send email
      # with: pass an object to be accessed by the mailer
      # deliver_now: to be processed synchronously
      PasswordMailer.with(user: @user).reset.deliver_now
    end

    # For security reason, we always show the notice to make it more difficult
    # to guess whether an email exists in the datatabase or not.
    redirect_to root_path, notice: "If an account with that email was found, we have sent a link to reset your password."
  end
end