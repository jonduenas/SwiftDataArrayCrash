//
//  Item.swift
//  SwiftDataArrayCrash
//
//  Created by Jon Duenas on 8/24/23.
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
