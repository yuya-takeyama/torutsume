class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook],
         :stretches => 10

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data']
        user.facebook_id    = data['uid']
        user.facebook_token = data['credentials']['token']
      end
    end
  end

  def self.find_for_facebook_oauth(access_token, signed_in_resource = nil)
    data = access_token.extra.raw_info
    User.where(:facebook_id => data.id).first
  end

  def name_for_git
    if name.blank?
      username
    else
      name
    end
  end
end
