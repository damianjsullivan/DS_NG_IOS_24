//
//  BookData.swift
//  Netgear Books
//
//  Created by Damian Sullivan on 06/08/2024.
//

import Foundation

extension Book {
    static var sampleData = loadSampleData()
    
    static private func loadSampleData() -> [Book] {
        guard let url = Bundle.main.url(forResource: "sampleBooks", withExtension: "json") else {
            return []
        }
        if let jsonData = try? Data(contentsOf: url), let bookResponse = try? JSONDecoder().decode(BookResponse.self, from: jsonData) {
            return bookResponse.items
        }
        return []
    }
}
