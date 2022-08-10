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
    var feelsLikeTemperature: Double
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
        case feelsLikeTemperature = "feels_like"
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
        feelsLikeTemperature = 0.0
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
