//
//  Configuration.swift
//  Books
//
//  Created by Damian Sullivan on 08/08/2024.
//

import Foundation

enum Configuration {
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }
    
    static var infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    static func readString(forKey key: String) -> String {
        guard let data = Configuration.infoDictionary[key] else {
            fatalError("\(key) not set in plist for this environment")
        }
        guard let value = data as? String else {
            fatalError("\(key): \(data) is not a String")
        }
        return value
    }
}

enum API {
    static var baseURL: String {
        return "https://\(Configuration.readString(forKey: "BASE_URL"))"
    }
    
    static var apiKey: String {
        Configuration.readString(forKey: "API_KEY")
    }
}
