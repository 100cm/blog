class ApplicationController < ActionController::Base
  before_filter :authenticate_user!, :except => [:show, :index]
  before_filter :set_title

  before_action :configure_permitted_parameters, if: :devise_controller?


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :store_location


  def set_title

    @page_title="icepoint"
  end
  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get?
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls

      if request.format == "text/html" || request.content_type == "text/html"
        session[:previous_url] = request.fullpath
        session[:last_request_time] = Time.now.utc.to_i
      end
    end
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end
  def after_sign_out_path_for(resource)
    session[:previous_url] || root_path
  end

  def ensure_logged_in!
    if not user_signed_in?
      return render :text => "please login", :status => :bad_request
    end
  end
  def configure_permitted_parameters

    devise_parameter_sanitizer.for(:sign_up) << :username

  end
  def admin?
    self.admin == true
  end

end
