//
//  WeatherData.swift
//  ParsingJSONLab
//
//  Created by Tiffany Obi on 11/27/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import Foundation

struct ListOfCities:Codable {
    let list: [List]
}
struct List:Codable {
    let name: String
    let main: Temp
    let weather: [Details]
}

struct Temp:Codable {
    let temp: Double
}

struct Details:Codable {
    let description: String
    
}

extension ListOfCities {
    
    static func getCities() -> [List] {
        
        var cityData = [List]()
        
        guard let fileURL = Bundle.main.url(forResource: "weatherInfo", withExtension: "json") else {
            fatalError("couldnt locate json Data")
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            
            let citiSpecifics = try JSONDecoder().decode(ListOfCities.self, from: data)
            
            cityData = citiSpecifics.list
        } catch {
            fatalError("failed to load content \(error)")
        }
        return cityData
    }
}
