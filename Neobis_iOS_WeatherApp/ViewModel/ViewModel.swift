//
//  ViewModel.swift
//

import Foundation

protocol WeatherViewModelProtocol {
    var updateUI: ((WeatherData) -> Void)? { get set }

    func fetchWeather(cityName: String)
//    func fetchDailyWeather(cityName: String)
}

class CurrentWeatherViewModel: WeatherViewModelProtocol {
    private let weatherManager: WeatherManager
    
//    var bindVMToViewController : (() -> Void) = {}
    //bind the viewControllers
    
    var updateUI: ((WeatherData) -> Void)?
    
    private var weatherData: WeatherData? {
        didSet {
            guard let weatherData else { return }
            updateUI?(weatherData)
        }
    }
    
    //    private var dailyWeatherData: dailyWeatherData?{
    //        didSet {
    //            self.bindVMToViewController()
    //        }
    //    }
    
    init(weatherManager: WeatherManager = WeatherManager()) {
        self.weatherManager = weatherManager
        //        fetchWeather(cityName: "London")
        //        fetchDailyWeather(cityName: "London")
    }
    
    func fetchWeather(cityName: String) {
        weatherManager.fetchWeather(cityName: cityName) { [weak self] weatherData in
            self?.weatherData = weatherData
        }
    }
    
    //    func fetchDailyWeather(cityName: String) {
    //        weatherManager.fetchDailyWeather(cityName: cityName) { [weak self] dailyWeatherData in
    //            self?.dailyWeatherData = dailyWeatherData
    //        }
    //    }
}
//
//if let city = secondaryView.searchTextField.text {
//    weatherManager.fetchWeather(cityName: city) { weatherData in
//        print("Received weather data: \(weatherData)")
//    }
//    weatherManager.fetchDailyWeather(cityName: city) { dailyWeatherData in
//        print("Received daily weather data: \(dailyWeatherData)")
//    }
//}

