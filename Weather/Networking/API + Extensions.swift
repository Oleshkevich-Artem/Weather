//
//  API + Extensions.swift
//  Weather
//
//  Created by Oleshkevich Artem on 26.07.22.
//

import Foundation

extension API {
    static let baseURLString = "http://api.openweather.org/data/2.5/"
    
    static func getURLFor(latitude: Double, longitude: Double) -> String {
        return "\(baseURLString)oncall?lat=\(latitude)&lon=\(longitude)&exclude=minutely&appid=\(key)&units=imperial"
    }
}
