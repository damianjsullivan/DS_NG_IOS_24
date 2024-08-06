//
//  BookSearchView.swift
//  Netgear Books
//
//  Created by Damian Sullivan on 05/08/2024.
//

import SwiftUI

struct BookSearchView: View {
    @State private var viewModel: BookSearchViewModel
    
    init(viewModel: BookSearchViewModel = BookSearchViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else {
                    booksListView()
                }
            }
            .navigationTitle("Book Search")
            .searchable(text: $viewModel.searchQuery, placement: .navigationBarDrawer(displayMode: .always))
            //TODO: Search as the user types, with debouncing and task cancelation
//            .onChange(of: viewModel.searchQuery) { _, _ in
//                viewModel.searchBooks()
//            }
            .onSubmit(of: .search) {
                Task {
                    await viewModel.searchBooks()
                }
            }
        }
    }
    
    private func booksListView() -> some View {
        TabView {
            ForEach(viewModel.books, id: \.id) { book in
                NavigationLink(destination: BookDetailsView(book: book)) {
                    BookCardView(book: book).padding()
                }
                .buttonStyle(PlainButtonStyle()) // Ensures the entire card is tappable
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

#Preview {
    let viewModel = BookSearchViewModel()
    viewModel.books = Book.sampleData
    viewModel.isLoading = false
    return BookSearchView(viewModel: viewModel)
        .environment(\.sizeCategory, .accessibilityLarge)
}
