module SessionsHelper
  def sign_in(doctor)
    remember_token = Doctor.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    doctor.update_attribute(:remember_token, Doctor.encrypt(remember_token))
    self.current_doctor = doctor
  end
  def signed_in?
    !current_doctor.nil?
  end
  def current_doctor=(doctor)
    @current_doctor = doctor
  end
  def current_doctor
    remember_token = Doctor.encrypt(cookies[:remember_token])
    @current_doctor ||= Doctor.find_by(remember_token: remember_token)
  end
  def current_doctor?(doctor)
    doctor == current_doctor
  end

  def signed_in_doctor
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def sign_out
    self.current_doctor = nil
    cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end
end
