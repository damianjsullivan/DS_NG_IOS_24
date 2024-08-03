//
//  Item.swift
//  Netgear Books
//
//  Created by Damian Sullivan on 03/08/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
