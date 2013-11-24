class Account::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    authorize :facebook do
      auth = request.env['omniauth.auth'].except('extra')
      session['devise.facebook_data'] = auth
      session['account.sign_up'] = {
        'email' => auth.info.email
      }
    end
  end

  private
  def authorize provider
    @user = User.send "find_for_#{provider}_oauth", request.env["omniauth.auth"], current_user

    provider_name = provider.to_s.titleize

    if current_user
      if @user.nil?
        current_user.connect_with provider, request.env['omniauth.auth']

        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => provider_name
      elsif @user != current_user
        # TODO: I18n
        flash[:error] = "That #{provider_name} account is already linked to a different user."
      else
        flash[:notice] = "Your account is already linked with the #{provider_name} account."
      end
      redirect_to edit_user_registration_path
    else
      if @user
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => provider.to_s.titleize
        sign_in_and_redirect @user, :event => :authentication
      else
        yield if block_given?
        redirect_to new_user_registration_url
      end
    end
  end
end
