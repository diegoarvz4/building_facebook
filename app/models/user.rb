# frozen_string_literal:true

class User < ApplicationRecord
  include Gravtastic
  gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :profile_creation
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, foreign_key: :author_id
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_many :likes, dependent: :destroy
  # friendship association
  has_many :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'

  def self.new_with_session(params, session)
    super.tap do |user|
      data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
      if data
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.image = auth.info.image # assuming the user model has an image
    end
  end

  private

  def profile_creation
    # give a default user name and birthdate
    profile = Profile.new(name: email.split('@')[0].capitalize,
                          birthdate: Time.now,
                          city: '',
                          country: '',
                          description: '')
    self.profile = profile
  end
end
