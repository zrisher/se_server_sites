# http://sourcey.com/rails-4-omniauth-using-devise-with-twitter-facebook-and-linkedin/
# https://github.com/plataformatec/devise/issues/2432

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def self.provides_callback_for(provider)
    class_eval %Q{
      def #{provider}
        @user = User.find_for_oauth(env["omniauth.auth"], current_user)

        if @user.persisted?
          sign_in_and_redirect @user, event: :authentication
          set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
        else
          session["devise.#{provider}_data"] = env["omniauth.auth"]
          redirect_to new_user_registration_url
        end
      end
    }
  end

  [:steam].each do |provider|
    provides_callback_for provider
  end

  layout false

  # this is the only spot where we allow CSRF, our openid / oauth redirect
  # will not have a CSRF token, however the payload is all validated so its safe
  skip_before_filter :verify_authenticity_token, only: :steam

  def after_sign_in_path_for(resource)
    if resource.email_verified?
      super resource
    else
      #finish_signup_path(resource)
      root_path
    end
  end
end