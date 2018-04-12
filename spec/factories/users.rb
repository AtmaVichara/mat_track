FactoryBot.define do
  factory :user do
    first_name "MyString"
    last_name "MyString"
    token "MyString"
    refresh_token "MyString"
    expires_at "MyString"
    email "crinkleman.gents@camor.com"
    password_digest "password"
    role 1
  end
end
