//
//  BookCardView.swift
//  Books
//
//  Created by Damian Sullivan on 06/08/2024.
//

import SwiftUI

struct BookCardView: View {
    
    @State private var viewModel: BookDetailsViewModel
    
    init(book: Book) {
        _viewModel = State(initialValue: BookDetailsViewModel(book: book))
    }
    
    var body: some View {
        VStack {
            // Image at the top
            if let url = viewModel.thumbnailURL {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView() // Loading state
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            // The following is as per the requirements, but it does not look good.
                            //.aspectRatio(16/9, contentMode: .fit)
                            .frame(maxWidth: 300)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    case .failure:
                        placeholderImage()
                    @unknown default:
                        placeholderImage()
                    }
                }
            } else {
                placeholderImage()
            }
            
            // Title and authors below the image
            Text(viewModel.title)
                .font(.headline)
                .padding(.top, 2)
            Text(viewModel.authors)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(width: 300) // Ensures that the card has a consistent width
        .background(Color(UIColor.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(radius: 5)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("\(viewModel.title) by \(viewModel.authors)")
    }
    
    private func placeholderImage() -> some View {
        Image(systemName: "photo.on.rectangle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            // The following is as per the requirements, but it does not look good.
            //.aspectRatio(16/9, contentMode: .fit)
            .frame(maxWidth: 300)
            .foregroundColor(.gray)
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    BookCardView(book: Book.sampleData.first!)
        .environment(\.sizeCategory, .accessibilityLarge)
}
