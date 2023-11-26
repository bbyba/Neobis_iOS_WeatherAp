//
//  APIService.swift
//  Neobis_iOS_WeatherApp
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=cec158852b5addf4cd84364ca0ea0d17&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        //1. Create a URL
        guard let url = URL(string: urlString) else {fatalError("MissingURL")}
        
        //2. Create a URL Session
        let session = URLSession(configuration: .default)
        
        //3. Give the session a task
        let task = session.dataTask(with: url, completionHandler: handle(data: response: error: ))
        
        //4. Start the task
        task.resume()
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?){
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data{
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }

}

