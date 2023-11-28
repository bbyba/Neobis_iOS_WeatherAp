//
//  ViewModel.swift
//

import Foundation

protocol WeatherViewModelProtocol {
    
//    var didTapSearch: (() -> Void)? { get set }
    
    func fetchWeather(cityName: String)
    func fetchDailyWeather(cityName: String)
    func updateUI()
}

class CurrentWeatherViewModel: WeatherViewModelProtocol {
    
    private var weatherManager: WeatherManager!
    
    var bindVMToViewController : (() -> Void) = {}
    //bind the viewControllers
    
    private var weatherData: WeatherData? {
        didSet {
            self.bindVMToViewController()
        }
    }
    
    private var dailyWeatherData: dailyWeatherData?{
        didSet {
            self.bindVMToViewController()
        }
    }
    
    
    init() {
        self.weatherManager = WeatherManager()
        fetchWeather(cityName: "London")
        fetchDailyWeather(cityName: "London")
    }
    
    func fetchWeather(cityName: String) {
        weatherManager.fetchWeather(cityName: cityName) { [weak self] weatherData in
            self?.weatherData = weatherData
        }
    }
    
    func fetchDailyWeather(cityName: String) {
        weatherManager.fetchDailyWeather(cityName: cityName) { [weak self] dailyWeatherData in
            self?.dailyWeatherData = dailyWeatherData
        }
    }
    
    func updateUI() {
        <#code#>
    }
}


//    func updateData(weatherData: WeatherData, dailyWeatherData: dailyWeatherData) {   //in the viewController?
//        DispatchQueue.main.async {
//            <#code#>
//        }
//    }

//
//if let city = secondaryView.searchTextField.text {
//    weatherManager.fetchWeather(cityName: city) { weatherData in
//        print("Received weather data: \(weatherData)")
//    }
//    weatherManager.fetchDailyWeather(cityName: city) { dailyWeatherData in
//        print("Received daily weather data: \(dailyWeatherData)")
//    }
//}

