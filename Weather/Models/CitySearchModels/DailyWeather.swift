//
//  DailyWeather.swift
//  Weather
//
//  Created by Oleshkevich Artem on 26.07.22.
//

import Foundation

struct DailyWeather: Codable, Identifiable {
    var currentDate: Int
    var temperature: Temperature
    var weather: [WeatherDetail]
    
    enum CodingKeys: String, CodingKey {
        case currentDate = "dt"
        case temperature = "temp"
        case weather
    }
    
    init() {
        currentDate = 0
        temperature = Temperature(min: 0.0, max: 0.0)
        weather = [WeatherDetail(main: "", description: "", icon: "")]
    }
}

extension DailyWeather {
    var id: UUID {
        return UUID()
    }
}
