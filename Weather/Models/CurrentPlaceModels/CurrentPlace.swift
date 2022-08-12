//
//  CurrentPlace.swift
//  Weather
//
//  Created by Oleshkevich Artem on 11.08.22.
//

import Foundation

struct CurrentPlace: Codable {
    var name: String
    
    static func empty() -> CurrentPlace {
        return CurrentPlace(name: "Kyiv")
    }
}

