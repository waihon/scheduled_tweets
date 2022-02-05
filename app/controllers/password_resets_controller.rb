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

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
   rescue ActiveSupport::MessageVerifier::InvalidSignature
     redirect_to sign_in_path, alert: "Your token has expired. Please try again."
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to sign_in_path, notice: "Your password was reset succesfully. Please sign in."
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end