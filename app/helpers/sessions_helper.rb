module SessionsHelper

  def current_disease
    @current_disease ||= Disease.find_by(id: session[:disease_id])
  end

end
