//
//  BookSearchViewModelTests.swift
//  Netgear BooksTests
//
//  Created by Damian Sullivan on 06/08/2024.
//

import XCTest
@testable import Books

final class BookSearchViewModelTests: XCTestCase {
    var viewModel: BookSearchViewModel!
    var mockService: MockBookService!
    
    override func setUpWithError() throws {
        mockService = MockBookService()
        try mockService.loadSampleData()
        viewModel = BookSearchViewModel(bookService: mockService)
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        mockService = nil
    }
    
    func testSearchBooksWithResults() async {
        // Arrange
        viewModel.searchQuery = "West"
        let expectation = expectation(description: "Search Complete")
        
        // Act
        await viewModel.searchBooks() {
            expectation.fulfill()
        }
        
        // Assert
        await fulfillment(of: [expectation])
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertEqual(viewModel.books.count, 1)
    }
    
    func testSearchBooksWithNoResults() async {
        // Arrange
        viewModel.searchQuery = "NonExistentBook"
        let expectation = expectation(description: "Search Complete")
        
        // Act
        await viewModel.searchBooks() {
            expectation.fulfill()
        }
        
        // Assert
        await fulfillment(of: [expectation])
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertEqual(viewModel.books.count, 0)
    }
    
    func testSearchBooksWithEmptyQuery() async {
        // Arrange
        viewModel.searchQuery = ""
        let expectation = expectation(description: "Search Complete")
        
        // Act
        await viewModel.searchBooks() {
            expectation.fulfill()
        }
        
        // Assert
        await fulfillment(of: [expectation])
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertEqual(viewModel.books.count, 0)
    }
    
    func testSearchBooksHandlesError() async {
        // Arrange
        viewModel.searchQuery = "Swift"
        mockService.error = BookServiceError.invalidURL
        let expectation = expectation(description: "Search Complete")
        
        // Act
        await viewModel.searchBooks() {
            expectation.fulfill()
        }
        
        // Assert
        await fulfillment(of: [expectation])
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertEqual(viewModel.errorMessage, "Something went wrong. Please try again.")
        XCTAssertEqual(viewModel.books.count, 0)
    }
}
