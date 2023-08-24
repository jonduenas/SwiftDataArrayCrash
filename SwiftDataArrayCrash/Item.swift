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
    var child: Child

    init(timestamp: Date, child: Child) {
        self.timestamp = timestamp
        self.child = child
    }
}

struct Child: Codable {
    let times: [TimeInterval]
}
