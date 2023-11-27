//
//  APIService.swift
//

import Foundation
//
//struct WeatherManager {
//    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=cec158852b5addf4cd84364ca0ea0d17&units=metric"
//    
//    func fetchWeather(cityName: String) {
//        let urlString = "\(weatherURL)&q=\(cityName)"
//        performRequest(with: urlString)
//    }
//    
//    func performRequest(with urlString: String) {
//        if let url = URL(string: urlString) {
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { (data, response, error) in
//                if error != nil {
//                    print(error!)
//                    return
//                }
//                if let safeData = data {
//                    self.parseJSON(safeData)
//                }
//            }
//            task.resume()
//        }
//    }
//       
//    func parseJSON(_ weatherData: Data) {
//        let decoder = JSONDecoder()
//        do {
//            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
//            let city = decodedData.name
//            let country = decodedData.sys.country
//            let id = decodedData.weather[0].id
//            let temp = decodedData.main.temp
//            let wind = decodedData.wind.speed
//            let humidity = decodedData.main.humidity
//            let visibility = decodedData.visibility
//            let airPressure = decodedData.main.pressure
//            
//            let weatherModel = WeatherModel(conditionId: id,
//                                            cityName: city,
//                                            countryName: country,
//                                            temperature: temp,
//                                            windSpeed: wind,
//                                            humidity: humidity,
//                                            visibility: visibility,
//                                            airPressure: airPressure)
//        } catch {
//            print(error)
//        }
//    }
//}


class WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=cec158852b5addf4cd84364ca0ea0d17&units=metric"
    
    func fetchWeather(cityName: String, completion: @escaping (WeatherData) -> ()) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        guard let url = URL(string: urlString) else {fatalError("MissingURL")}
        
        func fetchWeather(cityName: String) {
            performRequest(with: urlString)
        }
        
        func performRequest(with urlString: String) {
            if let url = URL(string: urlString) {
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        print("Data Task Error: \(error.localizedDescription)")
                        return
                    }
                    
                    guard let data = data else { return }
                    
                    do {
                        let weather = try JSONDecoder().decode(WeatherData.self, from: data)
                        completion(weather)
                        let city = weather.name
                        let country = weather.sys.country
                        let id = weather.weather[0].id
                        let temp = weather.main.temp
                        let wind = weather.wind.speed
                        let humidity = weather.main.humidity
                        let visibility = weather.visibility
                        let airPressure = weather.main.pressure
                        
                        let weatherModel = WeatherModel(conditionId: id,
                                                        cityName: city,
                                                        countryName: country,
                                                        temperature: temp,
                                                        windSpeed: wind,
                                                        humidity: humidity,
                                                        visibility: visibility,
                                                        airPressure: airPressure)
                    } catch let jsonError {
                        print(jsonError)
                    }
                }.resume()
            }
        }
    }
    
    func fetchDailyWeather(cityName: String, completion: @escaping (dailyWeatherData) -> ()) {
        guard let url = URL(string: "api.openweathermap.org/data/2.5/forecast?q=\(cityName)&appid=cec158852b5addf4cd84364ca0ea0d17&units=metric") else {fatalError("MissingURL")}
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let forecast = try JSONDecoder().decode(dailyWeatherData.self, from: data)
                completion(forecast)
            } catch {
                print("Error decoding forecast data: \(error)")
            }
        }
        task.resume()
    }
}
