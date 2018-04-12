module OmniauthSupport

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      "provider"=>"google_oauth2",
      "uid"=>"123412341234",
      "info"=>
        {"name"=>"Jeffy Montague",
          "email"=>"jmontagueIII@gmail.com",
          "first_name"=>"Jeffy",
          "last_name"=>"Montague",
          "image"=>
          "wat.jpg",
          "urls"=>{"Google"=>"https://plus.google.com/112931826108150331857"}
        },
      "credentials"=>
        {"token"=>
          "token1234",
          "expires_at"=>1523544089,
          "expires"=>true
        }
      })
  end

end
