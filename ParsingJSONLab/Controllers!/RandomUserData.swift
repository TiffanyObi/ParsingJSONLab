//
//  RandomUserData.swift
//  ParsingJSONLab
//
//  Created by Tiffany Obi on 11/29/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import Foundation

struct Results: Codable {
    var results: [User]
}
struct User: Codable {
    var name: Govt
    var location: Address
    var email: String
    var dob: Birthday
}

struct Govt: Codable {
    
    var title: String
    var first: String
    var last: String
}

struct Address: Codable {
    var street: Specifics
    var city: String
    var state: String
    var country: String
}

struct  Birthday: Codable {
    var date: String
}

struct Specifics: Codable {
    var number: Double
    var name: String
}

extension Results {
    
    static func getUsers() -> [User]{
        
        var userData = [User]()
        
        guard let fileURL = Bundle.main.url(forResource: "randomUsers", withExtension: "json") else {
            fatalError("Could not locate url")
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let userSpecifics = try JSONDecoder().decode(Results.self, from: data)
            
            userData = userSpecifics.results
            dump(userData)
        } catch {
            fatalError("failed to load contect \(error)")
        }
        
        return userData
    }
}
