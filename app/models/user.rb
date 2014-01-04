class User < ActiveRecord::Base
  has_many :texts
  has_many :comments

  validates_presence_of :username
  validates_format_of :username, with: /\A[a-z][a-z0-9\-]{,19}\z/i

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook],
         :stretches => 10

  include FriendlyId
  friendly_id :username

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data']
        user.facebook_id    = data['uid']
        user.facebook_token = data['credentials']['token']
      end
      user.username = params[:username]
      user.name     = params[:name]
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
