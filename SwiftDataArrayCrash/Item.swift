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
//    let times: [TimeInterval]

    init(
        timestamp: Date,
        child: Child
//        times: [TimeInterval]
    ) {
        self.timestamp = timestamp
        self.child = child
//        self.times = times
    }
}

struct Child: Codable {
    let times: [TimeInterval]
}
