//
//  BookService.swift
//  Netgear Books
//
//  Created by Damian Sullivan on 04/08/2024.
//

import Foundation

// Define an error type
enum BookServiceError: Error {
    case invalidURL
    case invalidResponse
    case networkError(Error)
}

class BookService: BookServiceProtocol {
    private let apiKey = "AIzaSyAkRTKoU91vgrSWZrgQgY609i7COmZ-dkI"
    private let baseURL = "https://www.googleapis.com/books/v1/volumes"
    
    /// Searches books using the given query string.
    /// - Parameter query: The search query string.
    /// - Returns: An array of books matching the search criteria.
    /// - Throws: An error if the network request fails or the data cannot be parsed.
    func searchBooks(query: String) async throws -> [Book] {
        guard var urlComponents = URLComponents(string: baseURL) else {
            throw BookServiceError.invalidURL
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "key", value: apiKey)
        ]
        
        guard let url = urlComponents.url else {
            throw BookServiceError.invalidURL
        }
        
        // Create a URL request
        let request = URLRequest(url: url)
        
        // Perform network request using async/await
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                throw BookServiceError.invalidResponse
            }
            let bookResponse = try JSONDecoder().decode(BookResponse.self, from: data)
            return bookResponse.items
        } catch {
            throw BookServiceError.networkError(error)
        }
    }
}
