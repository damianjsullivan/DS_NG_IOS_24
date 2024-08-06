//
//  BookServiceTests.swift
//  BooksTests
//
//  Created by Damian Sullivan on 06/08/2024.
//

import XCTest
@testable import Books

final class BookServiceTests: XCTestCase {
    var mockService: MockBookService!
    
    override func setUpWithError() throws {
        mockService = MockBookService()
        
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "sampleBooks", withExtension: "json") else {
            XCTFail("Missing file: testBooks.json")
            return
        }
        let jsonData = try Data(contentsOf: url)
        let bookResponse = try JSONDecoder().decode(BookResponse.self, from: jsonData)
        mockService.mockBooks = bookResponse.items
    }
    
    override func tearDownWithError() throws {
        mockService = nil
    }
    
    func testSearchBooksReturnsBooks() async throws {
        // Act
        let result = try await mockService.searchBooks(query: "West")
        
        // Assert
        XCTAssertEqual(result.count, 1)
        XCTAssertTrue(result.contains(where: { $0.volumeInfo.title == "The West of Ireland" }))
    }
    
    func testSearchBooksThrowsError() async throws {
        // Arrange
        mockService.error = BookServiceError.invalidURL
        
        // Act & Assert
        do {
            _ = try await mockService.searchBooks(query: "West")
            XCTFail("Expected error but got success")
        } catch {
            // Then
            XCTAssertNotNil(error)
        }
    }
}
