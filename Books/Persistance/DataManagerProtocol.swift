//
//  DataManagerProtocol.swift
//  Books
//
//  Created by Damian Sullivan on 06/08/2024.
//

import Foundation

protocol DataManagerProtocol {
    func fetchBooks(query: String) throws -> [Book]
    func saveBook(_ book: Book) throws
}
