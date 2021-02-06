//
//  ModelSubscription.swift
//  CompleteProject
//
//  Created by kh on 2021/2/6.
//

import Foundation

struct ModelSubscriptionList {
    var items: [ModelSubscription] = []
    init() {
        items.append(ModelSubscription(itemType: "YEARLY", itemPrice: 25, itemDateRange: "365 days"))
        items.append(ModelSubscription(itemType: "QUARTERLY", itemPrice: 15, itemDateRange: "90 days"))
        items.append(ModelSubscription(itemType: "MONTHLY", itemPrice: 5, itemDateRange: "30 days"))
    }
}

struct ModelSubscription: Hashable {
    var itemType: String
    var itemPrice: Int
    var itemDateRange: String
}
