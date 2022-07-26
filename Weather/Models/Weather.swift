//
//  Weather.swift
//  Weather
//
//  Created by Oleshkevich Artem on 26.07.22.
//

import Foundation

struct Weather: Codable, Identifiable {
    var currentDate: Int
    var temperature: Double
    var feelLikeTemperature: Double
    var pressure: Int
    var humidity: Int
    var dewPoint: Double
    var clouds: Int
    var windSpeed: Double
    var windDegree: Int
    var weather: [WeatherDetail]
    
    enum CodingKeys: String, CodingKey {
        case currentDate = "dt"
        case temperature = "temp"
        case feelLikeTemperature = "feel_like"
        case pressure
        case humidity
        case dewPoint = "dew_point"
        case clouds
        case windSpeed = "wind_speed"
        case windDegree = "wind_deg"
        case weather
    }
    
    init() {
        currentDate = 0
        temperature = 0.0
        feelLikeTemperature = 0.0
        pressure = 0
        humidity = 0
        dewPoint = 0.0
        clouds = 0
        windSpeed = 0.0
        windDegree = 0
        weather = []
    }
}

extension Weather {
    var id: UUID {
        return UUID()
    }
}
