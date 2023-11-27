//
//  DailyModel.swift
//
//
import Foundation

struct dailyWeatherData: Codable {
    let list: [dailyWeatherDetails]
}

struct dailyWeatherDetails: Codable {
    let dt: Int
    let main: dailyMainDetails
    let weather: [dailyWeather]
    let dt_txt: String
}

struct dailyMainDetails: Codable {
    let temp: Double
}

struct dailyWeather: Codable {
    let id: Int
    let main: String
    let icon: String
}

