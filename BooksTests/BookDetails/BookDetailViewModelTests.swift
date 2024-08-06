//
//  BookDetailViewModelTests.swift
//  Netgear BooksTests
//
//  Created by Damian Sullivan on 06/08/2024.
//

import XCTest
@testable import Books

final class BookDetailsViewModelTests: XCTestCase {
    func testLoadBookDetails() {
        // Arrange
        // Arrange
        let book = Book.sampleData.first!
        let viewModel = BookDetailsViewModel(book: book)
        
        // Act
        viewModel.loadBookDetails()
        
        // Assert
        XCTAssertEqual(viewModel.title, "The West of Ireland")
        XCTAssertEqual(viewModel.authors, "Henry Coulter")
        XCTAssertEqual(viewModel.description, "No description available.")
    }
}
