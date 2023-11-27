//
//  ViewModel.swift
//

import Foundation

//protocol WeatherViewModelProtocol {
//    
////    var didTapSearch: (() -> Void)? { get set }
//    
//    func fetchWeather(cityName: String)
//    func fetchDailyWeather(cityName: String)
//    func transformData(weather: WeatherData, dailyWeather: dailyWeatherData)
//    func updateUI()
//}
//
//class CurrentWeatherViewModel {
//    private var weatherManager = WeatherManager()
////    private var weatherData: Weather?
////    private var dailyWeatherData: DailyWeather?
//    //bind the viewControllers
//    
//    init() {
//        self.weatherManager = WeatherManager()
//        fetchWeather(cityName: "Seoul")
//        fetchDailyWeather(cityName: "Seoul")
//    }
//    
//    func fetchWeather(cityName: String) {
//        weatherManager.fetchWeather(cityName: cityName) { (weatherData) in
//            self.weatherData = weatherData
//        }
//    }
//    
//    func fetchDailyWeather(cityName: String) {
//        weatherManager.fetchDailyWeather(cityName: cityName) { (dailyWeatherData) in
//            self.dailyWeatherData = dailyWeatherData
//        }
//    }
//    
//    func transformData(weather: WeatherData, dailyWeather: dailyWeatherData) {
//        let city = weather.name
//        let country = weather.sys.country
//        let id = weather.weather[0].id
//        let temp = weather.main.temp
//        let wind = weather.wind.speed
//        let humidity = weather.main.humidity
//        let visibility = weather.visibility
//        let airPressure = weather.main.pressure
//        }
//}


//if let city = secondaryView.searchTextField.text {
//    weatherManager.fetchWeather(cityName: city) { weatherData in
//        print("Received weather data: \(weatherData)")
//    }
//    weatherManager.fetchDailyWeather(cityName: city) { dailyWeatherData in
//        print("Received daily weather data: \(dailyWeatherData)")
//    }
//}
