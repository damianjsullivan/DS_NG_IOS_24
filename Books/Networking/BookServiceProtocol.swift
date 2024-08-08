//
//  BookServiceProtocol.swift
//  Netgear Books
//
//  Created by Damian Sullivan on 04/08/2024.
//

import Foundation

protocol BookServiceProtocol {
    func fetchBooks(query: String) async throws -> [Book]
}
