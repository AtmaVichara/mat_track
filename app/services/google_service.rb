class GoogleService

  def initialize(user)
    @user = user
  end

  def calendar_list
    get_url('calendar/v3/users/me/calendarList')
  end

  private

  attr_reader :user

    def get_url(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

    def headers
      {
        "Authorization" => "Bearer #{user.token}"
      }
    end

    def conn
      Faradar.new("https://www.googleapis.com/", headers: headers)
    end
end
