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
        try mockService.loadSampleData()
    }
    
    override func tearDownWithError() throws {
        mockService = nil
    }
    
    func testSearchBooksReturnsBooks() async throws {
        // Act
        let result = try await mockService.fetchBooks(query: "West")
        
        // Assert
        XCTAssertEqual(result.count, 1)
        XCTAssertTrue(result.contains(where: { $0.volumeInfo.title == "The West of Ireland" }))
    }
    
    func testSearchBooksThrowsError() async throws {
        // Arrange
        mockService.error = BookServiceError.invalidURL
        
        // Act & Assert
        do {
            _ = try await mockService.fetchBooks(query: "West")
            XCTFail("Expected error but got success")
        } catch {
            // Then
            XCTAssertNotNil(error)
        }
    }
}
