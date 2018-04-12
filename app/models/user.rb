class User < ApplicationRecord
  has_many :user_schools
  has_many :schools, through: :user_schools
  has_many :attendances
  has_many :events, through: :attendances
  has_secure_password

  def self.update_or_create(auth)
    binding.pry
    user = User.find_by(email: auth[:info][:email]) || User.new
    if user.password == nil
      user.attributes = {
        provider: auth[:provider],
        password: 'placeholder',
        uid: auth[:uid],
        email: auth[:info][:email],
        first_name: auth[:info][:first_name],
        last_name: auth[:info][:last_name],
        token: auth[:credentials][:token],
        refresh_token: auth[:credentials][:refresh_token],
        expires_at: auth[:credentials][:expires_at]
      }
    else
      user.attributes = {
        provider: auth[:provider],
        uid: auth[:uid],
        email: auth[:info][:email],
        first_name: auth[:info][:first_name],
        last_name: auth[:info][:last_name],
        token: auth[:credentials][:token],
        refresh_token: auth[:credentials][:refresh_token],
        expires_at: auth[:credentials][:expires_at]
      }
    end
    user.save!
    user
  end

end
