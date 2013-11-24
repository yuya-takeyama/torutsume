class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook],
         :stretches => 10

  def self.find_for_facebook_oauth(access_token, signed_in_resource = nil)
    data = access_token.extra.raw_info
    User.where(:facebook_id => data.id).first
  end
end
