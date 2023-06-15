import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="weather"
export default class extends Controller {
  static targets = ["icon", "description", "header"]

  connect() {
    console.log("Hello from stimulus");
    this.apiKey = "654e3ecd3aaf11243bcaefa602f39f2a";
    this.fetchWeatherByCoordinates();
  }

  fetchWeatherByCoordinates() {
    navigator.geolocation.getCurrentPosition((data) => {
      fetch(`https://api.openweathermap.org/data/2.5/weather?lat=${data.coords.latitude}&lon=${data.coords.longitude}&appid=${this.apiKey}&units=metric`)
        .then(response => response.json())
        .then((data) => {
          // MANUPULATING THE DATA ( WILL BE DELETED )
          data.weather[0].main = "Clear";


          if (data.weather[0].main == "Clear") {
            this.iconTarget.innerHTML = '<i class="fa-solid fa-sun"></i>'
          } else if (data.weather[0].main == "Clouds") {
            this.iconTarget.innerHTML = '<i class="fa-solid fa-cloud"></i>'
          } else if (data.weather[0].main == "Thunderstorm") {
            this.iconTarget.innerHTML = '<i class="fa-solid fa-cloud-bolt"></i>'
          } else if (data.weather[0].main == "Snow") {
            this.iconTarget.innerHTML = '<i class="fa-solid fa-snowflake"></i>'
          } else if (data.weather[0].main == "Rain") {
            this.iconTarget.innerHTML = '<i class="fa-solid fa-cloud-showers-heavy"></i>'
          } else if (data.weather[0].main == "Drizzle") {
            this.iconTarget.innerHTML = '<i class="fa-solid fa-cloud-rain"></i>'
          }
          this.descriptionTarget.innerText = data.weather[0].main;

          if (data.weather[0].main) {
            this.headerTarget.classList.remove("d-none")
          }
        })
    })
  }
  // #updateCard(data) {
  //   this.iconTarget.src = `https://openweathermap.org/img/w/${data.weather[0].icon}.png`
  //   this.temperatureTarget.innerText = `${Math.round(data.main.temp)} °C`
  //   this.descriptionTarget.innerText = data.weather[0].description
  //   this.cityTarget.innerText = data.name
  //   const today = new Date();
  //   const localOffset = data.timezone + today.getTimezoneOffset() * 60
  //   const localDate = new Date(today.setUTCSeconds(localOffset))
  //   const options = { weekday: 'long', month: 'long', day: 'numeric', hour: 'numeric', minute: 'numeric' }
  //   const formattedDate = localDate.toLocaleDateString("en-US", options)
  //   this.dateTarget.innerText = formattedDate
}
