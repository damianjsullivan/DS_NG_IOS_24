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
    
    func searchBooks(query: String) async throws -> [Book] {
        if let error = error {
            throw error
        }
        return mockBooks.filter { $0.volumeInfo.title.localizedStandardContains(query)}
    }
}
