//
//  API + Extensions.swift
//  Weather
//
//  Created by Oleshkevich Artem on 26.07.22.
//

import Foundation

extension API {
    static let baseURLString = "https://api.openweathermap.org/data/2.5/"
    
    static func getURLFor(latitude: Double, longitude: Double) -> String {
        return "\(baseURLString)onecall?lat=\(latitude)&lon=\(longitude)&exclude=minutely&appid=\(key)&units=metric"
    }
    
    static func getURLForCurrentPlace(latitude: Double, longitude: Double) -> String {
        return "\(baseURLString)weather?lat=\(latitude)&lon=\(longitude)&appid=\(key)&units=metric"
    }
}
