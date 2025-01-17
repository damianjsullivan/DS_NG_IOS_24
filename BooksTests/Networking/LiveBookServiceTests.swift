//
//  BookServiceTests.swift
//  Netgear BooksTests
//
//  Created by Damian Sullivan on 05/08/2024.
//

import XCTest
@testable import Books

final class LiveBookServiceTests: XCTestCase {

    var bookService: BookService!
    
    override func setUpWithError() throws {
        super.setUp()
        bookService = BookService()
    }
    
    override func tearDownWithError() throws {
        bookService = nil
        super.tearDown()
    }
    
    func testFetchBooksSuccessfully() async throws {
        // Given
        let query = "War and Peace"
        
        // When
        let books = try await bookService.searchBooks(query: query)
        
        // Then
        XCTAssertFalse(books.isEmpty)
        XCTAssertEqual(books.first?.volumeInfo.title, "War and Peace")
    }
    
    func testFetchBooksFailure() async {
        // Given
        let query = "" // Invalid query to simulate failure
        
        do {
            _ = try await bookService.searchBooks(query: query)
            XCTFail("Expected error but got success")
        } catch {
            // Then
            XCTAssertNotNil(error)
        }
    }

}
