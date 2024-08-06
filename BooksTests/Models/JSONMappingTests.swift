//
//  JSONMappingTests.swift
//  Netgear BooksTests
//
//  Created by Damian Sullivan on 06/08/2024.
//

import XCTest
@testable import Books

final class JSONMappingTests: XCTestCase {

    func testJSONMapping() throws {
        let bundle = Bundle(for: type(of: self))
        
        guard let url = bundle.url(forResource: "sampleBooks", withExtension: "json") else {
            XCTFail("Missing file: testBooks.json")
            return
        }
        
        let jsonData = try Data(contentsOf: url)
        let bookResponse = try JSONDecoder().decode(BookResponse.self, from: jsonData)
        
        XCTAssertFalse(bookResponse.items.isEmpty)
    }
}
