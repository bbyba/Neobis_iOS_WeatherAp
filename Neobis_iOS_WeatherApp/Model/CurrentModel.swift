//
//  CurrentModel.swift
//

import Foundation

struct WeatherData: Codable {
    let weather: [Weather]
    let main: Main
    let visibility: Int
    let wind: Wind
    let dt: Int
    let sys: Sys        //has country
    let timezone: Int
    let id: Int
    let name: String    //city name

}

struct Main: Codable {
    let temp: Double
    let pressure: Int
    let humidity: Int
}

struct Weather: Codable {
    let id: Int
    let icon: String
}

struct Wind: Codable {
    let speed: Double
}

struct Sys: Codable {
    let country: String
}


