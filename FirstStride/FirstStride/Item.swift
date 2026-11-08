//
//  Item.swift
//  FirstStride
//
//  Created by alani quintanilla on 9/25/25.
//

import Foundation
import SwiftData

// Leftover from the Xcode template. The app doesn't use it yet,
// but the SwiftData container still needs a model to build the schema from.
@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
