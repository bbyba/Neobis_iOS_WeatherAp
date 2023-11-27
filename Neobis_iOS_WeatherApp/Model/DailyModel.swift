//
//  DailyModel.swift
//
//
import Foundation

struct dailyWeatherData: Codable {
    let list: [dailyWeatherDetails]
    let city: CityDetails
}

struct dailyWeatherDetails: Codable {
    let dt: Int
    let main: dailyMainDetails
    let weather: [dailyWeather]
    let sys: Sys
    let dt_txt: String
}

struct dailyMainDetails: Codable {
    let temp: Double
}

struct dailyWeather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct dailySys: Codable {
    let pod: String
}

struct CityDetails: Codable {
    let id: Int
    let name: String
//    let coord: Coord
    let country: String
    let timezone: Int
}
