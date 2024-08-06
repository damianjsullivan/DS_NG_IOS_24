//
//  DataManager.swift
//  Books
//
//  Created by Damian Sullivan on 06/08/2024.
//

import Foundation
import SwiftData


class DataManager: DataManagerProtocol {
    private let modelContainer: ModelContainer
    

    init() {
        do {
            let configuration = ModelConfiguration(for: Book.self, isStoredInMemoryOnly: false)
            self.modelContainer = try ModelContainer(for: Book.self, configurations: configuration)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func fetchBooks(query: String) throws -> [Book] {
//        let descriptor = FetchDescriptor<Book>(
////            predicate: #Predicate { $0.volumeInfo.title.localizedStandardContains(query) },
////            sortBy: [
////                .init(\.volumeInfo.title)
////            ]
//        )
        
        let descriptor = FetchDescriptor<Book>(sortBy: [SortDescriptor(\.volumeInfo.title)])
        
        let modelContext = ModelContext(modelContainer)
        return try modelContext.fetch(descriptor)
 
    }
    
    func saveBook(_ book: Book) throws {
        let modelContext = ModelContext(modelContainer)
        modelContext.insert(book)
        try modelContext.save()
    }
}

