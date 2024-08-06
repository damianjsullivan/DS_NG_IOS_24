//
//  BookCardViewModelTests.swift
//  BooksTests
//
//  Created by Damian Sullivan on 06/08/2024.
//

import XCTest
@testable import Books

final class BookCardViewModelTests: XCTestCase {
    
    func testLoadBookDetails() {
        // Arrange
        let book = Book.sampleData.first!
        let viewModel = BookCardViewModel(book: book)
        
        // Act
        viewModel.loadBookDetails()
        
        // Assert
        XCTAssertEqual(viewModel.title, "The West of Ireland")
        XCTAssertEqual(viewModel.authors, "Henry Coulter")
        XCTAssertEqual(viewModel.thumbnailURL, URL(string: "http://books.google.com/books/content?id=iGENAAAAYAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"))
    }
}
