//
//  ColorData.swift
//  ParsingJSONLab
//
//  Created by Tiffany Obi on 11/26/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import Foundation

struct GroupOfColors: Codable {
    
    let colors: [Colors]
}


struct Colors: Codable {
    let name: Value
    let rgb : RGBWrapper
    let hex : Clean
    
    
}
struct RGBWrapper: Codable {
    let r : Int
    let g: Int
    let b : Int
}

struct  Value: Codable {
    let value: String
}

struct Clean: Codable {
    let clean: String
}

extension GroupOfColors {
    
    static func getColors() -> [Colors] {
        
        var colorData = [Colors]()
        
        guard let fileURL = Bundle.main.url(forResource: "colors", withExtension: "json") else {
            fatalError("Could not locate json file")
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            
            let colorsSpecifics = try JSONDecoder().decode(GroupOfColors.self, from: data )
            
            colorData = colorsSpecifics.colors
            dump(colorData)
        } catch {
            fatalError("failed to load content \(error)")
        }
        return colorData
    }
}



