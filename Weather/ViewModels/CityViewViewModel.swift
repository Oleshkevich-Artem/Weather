//
//  CityViewViewModel\.swift
//  Weather
//
//  Created by Oleshkevich Artem on 26.07.22.
//

import SwiftUI
import CoreLocation
import Foundation

final class CityViewViewModel: NSObject, ObservableObject {
    @Published var currentLocation: CurrentPlace?
    
    @Published var weather = WeatherResponse.empty()
    
    @Published var city: String = "Paris" {
        didSet {
            getLocation()
        }
    }
    
    private var locationManager = LocationManager()
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    
    private lazy var dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter
    }()
    
    private lazy var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh a"
        return formatter
    }()
    
    var date: String {
        return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.current.currentDate)))
    }
    
    var weatherIcon: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].icon
        }
        return "sun.max.fill"
    }
    
    var temperature: String {
        return getTemperatureFor(temperature: weather.current.temperature)
    }
    
    var conditions: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].main
        }
        return ""
    }
    
    var windSpeed: String {
        return String(format: "%0.1f", weather.current.windSpeed)
    }
    
    var humidity: String {
        return String(format: "%d%%", weather.current.humidity)
    }
    
    var rainChances: String {
        return String(format: "%0.0f%%", weather.current.dewPoint)
    }
    
    override init() {
        super.init()
        getLocation()
    }
    
    func getTemperatureFor(temperature: Double) -> String {
        return String(format: "%0.1f", temperature)
    }
    
    func getTimeFor(timestamp: Int) -> String {
        return timeFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    func getDayFor(timestamp: Int) -> String {
        return dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    private func getLocation() {
        CLGeocoder().geocodeAddressString(city) { placemarks, error in
            if let places = placemarks,
               let place = places.first {
                self.getWeather(coordinates: place.location?.coordinate)
            }
        }
    }
    
    private func getWeather(coordinates: CLLocationCoordinate2D?) {
        if let coordinates = coordinates {
            let urlString = API.getURLFor(latitude: coordinates.latitude, longitude: coordinates.longitude)
            getWeatherInternal(urlString: urlString)
        }
        else {
            let urlString = API.getURLFor(latitude: 53.9, longitude: -27.5667)
            getWeatherInternal(urlString: urlString)
            self.city = "Minsk"
        }
        
    }
    
    private func getWeatherInternal(urlString: String) {
        NetworkManager<WeatherResponse>.fetch(for: URL(string: urlString)!) { (result) in
            switch result {
            case .success(let responce):
                DispatchQueue.main.async {
                    self.weather = responce
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func searchCurrentLocation() {
        if locationManager.manager.authorizationStatus == .authorizedAlways || locationManager.manager.authorizationStatus == .authorizedWhenInUse {
            if locationManager.manager.location?.coordinate != nil {
                getCurrentLocationName(coordinates: locationManager.manager.location?.coordinate)
            }
            else {
                requestLocation()
            }
        }
        else {
            requestPermission()
        }
    }
    
    private func requestPermission() {
        locationManager.manager.requestWhenInUseAuthorization()
    }
    
    private func requestLocation() {
        locationManager.manager.requestLocation()
        
        if let location = locationManager.location {
            getCurrentLocationName(coordinates: location)
        }
    }
    
    private func getCurrentLocationName(coordinates: CLLocationCoordinate2D?) {
        if let coordinates = coordinates {
            let urlString = API.getURLForCurrentPlace(latitude: coordinates.latitude, longitude: coordinates.longitude)
            getCurrentPlaceNameInternal(urlString: urlString)
        }
        else {
            let urlString = API.getURLForCurrentPlace(latitude: 0, longitude: 0)
            getCurrentPlaceNameInternal(urlString: urlString)
        }
        
    }
    
    private func getCurrentPlaceNameInternal(urlString: String) {
        NetworkManager<CurrentPlace>.fetch(for: URL(string: urlString)!) { (result) in
            switch result {
            case .success(let responce):
                DispatchQueue.main.async {
                    self.currentLocation = responce
                    self.getWeatherForCurrentLocation()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getWeatherForCurrentLocation() {
        if let currentLocation = currentLocation?.name {
            self.city = currentLocation
            getLocation()
        }
    }
    
    func getLottiesAnimationFor(icon: String) -> String {
        switch icon {
            case "01d":
                return "dayClearSky"
            case "01n":
                return "nightClearSky"
            case "02d":
                return "dayFewClouds"
            case "02n":
                return "nightFewClouds"
            case "03d":
                return "dayScatteredClouds"
            case "03n":
                return "nightScatteredClouds"
            case "04d":
                return "dayBrokenClouds"
            case "04n":
                return "nightBrokenClouds"
            case "09d":
                return "dayShowerRains"
            case "09n":
                return "nightShowerRains"
            case "10d":
                return "dayRain"
            case "10n":
                return "nightRain"
            case "11d":
                return "dayThunderstorm"
            case "11n":
                return "nightThunderstorm"
            case "13d":
                return "daySnow"
            case "13n":
                return "nightSnow"
            case "50d":
                return "dayMist"
            case "50n":
                return "dayMist"
            default:
                return "dayClearSky"
        }
    }
    
    func getWeatherIconFor(icon: String) -> Image {
        switch icon {
            case "01d":
                return Image(systemName: "sun.max.fill")
            case "01n":
                return Image(systemName: "moon.fill")
            case "02d":
                return Image(systemName: "cloud.sun.fill")
            case "02n":
                return Image(systemName: "cloud.moon.fill")
            case "03d":
                return Image(systemName: "cloud.fill")
            case "03n":
                return Image(systemName: "cloud.fill")
            case "04d":
                return Image(systemName: "cloud.fill")
            case "04n":
                return Image(systemName: "cloud.fill")
            case "09d":
                return Image(systemName: "cloud.drizzle.fill")
            case "09n":
                return Image(systemName: "cloud.drizzle.fill")
            case "10d":
                return Image(systemName: "cloud.heavyrain.fill")
            case "10n":
                return Image(systemName: "cloud.heavyrain.fill")
            case "11d":
                return Image(systemName: "cloud.bolt.fill")
            case "11n":
                return Image(systemName: "cloud.bolt.fill")
            case "13d":
                return Image(systemName: "cloud.snow.fill")
            case "13n":
                return Image(systemName: "cloud.snow.fill")
            case "50d":
                return Image(systemName: "cloud.fog.fill")
            case "50n":
                return Image(systemName: "cloud.fog.fill")
            default:
                return Image(systemName: "sun.max.fill")
        }
    }
}
