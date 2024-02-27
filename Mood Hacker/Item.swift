//
//  Item.swift
//  Mood Hacker
//
//  Created by Rachel Leiner on 2/27/24.
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
