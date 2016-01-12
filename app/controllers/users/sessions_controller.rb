class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end

#   def create
#   user = User.find_by_email(params[:email])

 
#   if user && user.authenticate(params[:password])
#     if params[:remember_me]


#       cookies.permanent[:auth_token] = user.auth_token
#     else
#       cookies[:auth_token] = user.auth_token
#     end
#     redirect_to root_url, :notice => "Logged in!"
#   else
#     flash.now.alert = "Invalid email or password"
#     render "new"
#   end
# end

# def destroy
#   cookies.delete(:auth_token)
#   redirect_to root_url, :notice => "Logged out!"
# end
end
