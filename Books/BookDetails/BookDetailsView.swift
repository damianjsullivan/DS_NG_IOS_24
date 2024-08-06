//
//  BookDetailsView.swift
//  Netgear Books
//
//  Created by Damian Sullivan on 05/08/2024.
//

import SwiftUI

import SwiftUI

struct BookDetailsView: View {
    @State private var viewModel: BookDetailsViewModel
    
    init(book: Book) {
        _viewModel = State(initialValue: BookDetailsViewModel(book: book))
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                // Book authors
                Text(viewModel.authors)
                    .font(.title3)
                    .foregroundColor(.secondary)
                
                // Book description
                Text(viewModel.description)
                    .font(.body)
                    .padding(.top)
                
                Spacer()
            }
            .padding()
            .navigationTitle(viewModel.title)
        }
    }
}

#Preview {
    return BookDetailsView(book: Book.sampleData.first!)
        .environment(\.sizeCategory, .accessibilityLarge)
}
