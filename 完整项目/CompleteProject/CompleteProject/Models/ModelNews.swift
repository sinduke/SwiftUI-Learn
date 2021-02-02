//
//  ModelNews.swift
//  CompleteProject
//
//  Created by kh on 2021/2/1.
//

import Foundation


// Codable 可以将对象和json之间互相转换, Hashable 可以将对象进行比较
struct ModelNews: Hashable, Codable {
    var title: String
    var subTitle: String
    var postDate: String
    
    init() {
        title = ""
        subTitle = ""
        postDate = ""
    }
}

struct ModelNewsList: Codable {
    var items: [ModelNews]
}
