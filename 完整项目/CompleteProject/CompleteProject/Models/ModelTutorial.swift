//
//  ModelTutorial.swift
//  CompleteProject
//
//  Created by kh on 2021/1/29.
//

import Foundation

enum TutorialStatus {
    case None
    case Undone
    case Completed
}

class ModelTutorial: NSObject {
    var sequence: Int
    var status: TutorialStatus
    var title: String
    var subTitle: String
    var starCount: Int
    var fireCount: Int
    var favoriteCount: Int
    
    override init() {
        let count = Int.random(in: 1...3)
        if count == 1 {
            self.status = .None
        } else if count == 2{
            self.status = .Undone
        } else {
            self.status = .Completed
        }
        self.sequence = 1
        self.title = "Getting started with SwiftUI"
        self.subTitle = "New accesories set"
        self.starCount = 5
        self.fireCount = 0
        self.favoriteCount = 0
    }
}
