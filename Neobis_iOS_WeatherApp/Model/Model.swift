//
//  DailyModel.swift
//

import Foundation

struct DailyModel {
    let weekDay: String
    let temperature: String
    let image: String
}

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let countryName: String
    let temperature: Double
    let windSpeed: Double
    let humidity: Int
    let visibility: Int
    let airPressure: Int
    
    var temperatureString: String {
        return String(format: "%.0f", temperature)
    }
    
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt.fill"
        case 300...321:
            return "cloud.drizzle.fill"
        case 500...531:
            return "cloud.rain.fill"
        case 600...622:
            return "cloud.snow.fill"
        case 701...781:
            return "cloud.fog.fill"
        case 800:
            return "sun.max.fill"
        case 801...804:
            return "cloud.bolt.fill"
        default:
            return "cloud.fill"
        }
    }
}
