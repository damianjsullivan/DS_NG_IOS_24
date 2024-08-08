//
//  MockBookService.swift
//  BooksTests
//
//  Created by Damian Sullivan on 06/08/2024.
//

import Foundation
@testable import Books

class MockBookService: BookServiceProtocol {
    var mockBooks: [Book] = []
    var error: Error?
    
    func loadSampleData() throws {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "sampleBooks", withExtension: "json") else {
            return
        }
        let jsonData = try Data(contentsOf: url)
        let bookResponse = try JSONDecoder().decode(BookResponse.self, from: jsonData)
        mockBooks = bookResponse.items
    }
    
    func fetchBooks(query: String) async throws -> [Book] {
        if let error = error {
            throw error
        }
        return mockBooks.filter { $0.volumeInfo.title.localizedStandardContains(query)}
    }
}
