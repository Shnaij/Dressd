class WeatherController < ApplicationController
  def index
    # Fetch weather data from API
    response = fetch_weather_data("City Name") # Replace "City Name" with the desired city

    if response.success?
      # Extract relevant weather data from the response
      weather_data = extract_weather_data(response.body)

      # Pass the weather data to the view
      @weather = weather_data
    else
      # Handle API request failure
      flash[:error] = "Failed to fetch weather data"
      # You can also render an error view or take other appropriate actions
    end
  end

  private

  def fetch_weather_data(city)
    # Use an HTTP client library like RestClient or HTTParty to make the API request
    # Example using RestClient:
    RestClient.get("https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=654e3ecd3aaf11243bcaefa602f39f2a
      &units=metric")
  end

  def extract_weather_data(response_body)
    # Parse the JSON response and extract relevant weather data
    # Example using JSON.parse:
    weather_json = JSON.parse(response_body)
    {
      temperature: weather_json["main"]["temp"],
      description: weather_json["weather"].first["description"],
      city: weather_json["name"]
    }
  end
end
