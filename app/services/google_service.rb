class GoogleService

  def initialize(user)
    @user = user
  end

  def make_event(event)
    post_url("calendar/v3/calendars/#{@user.email}/events/quickAdd", event.format_body)
  end

  private

  attr_reader :user

    def post_url(url, params)
      conn.post do |req|
        req.url url
        req.params = params
      end
    end

    def headers
      {
        "Authorization" => "Bearer #{user.token}"
      }
    end

    def conn
      Faraday.new("https://www.googleapis.com/", headers: headers)
    end
end
