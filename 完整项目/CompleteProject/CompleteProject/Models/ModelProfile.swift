//
//  ModelProfile.swift
//  CompleteProject
//
//  Created by kh on 2021/2/5.
//

import Foundation

struct ModelProfileList {
    var items: [ModelProfile] = []
    
    init() {
        items.append(ModelProfile(icon: "mpIconVip", title: "Go Premium", messageCount: 0))
        items.append(ModelProfile(icon: "mpIconFavorite", title: "My favorite tutorials", messageCount: 9))
        items.append(ModelProfile(icon: "mpIconWords", title: "My skills", messageCount: 8))
        items.append(ModelProfile(icon: "mpIconNews", title: "Download the resources", messageCount: 0))
        items.append(ModelProfile(icon: "mpIconSetting", title: "Clear the cache", messageCount: 0))
        items.append(ModelProfile(icon: "mpIconRate", title: "Rate the app", messageCount: 0))
    }
    
}

struct ModelProfile: Hashable {
    var icon: String
    var title: String
    var messageCount: Int
}
