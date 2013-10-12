class SessionsController < ApplicationController
  def new
    reset_session
  end

  def create

    if (Doctor.find_by_password_digest(params[:session][:password]) && doctor = Doctor.find_by(email: params[:session][:email].downcase))
      session[:doctor_id] = doctor.id
      redirect_to doctor
    else
      flash[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    session.destroy
    redirect_to signin_path
  end
end
