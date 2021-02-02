//
//  ModelQuiz.swift
//  CompleteProject
//
//  Created by kh on 2021/2/1.
//

import Foundation

struct ModelQuiz: Codable, Hashable {
    var title: String
    var subTitle: String
    var icon: String
    var correctRate: Int
    var submit: Int
    var starCount: Int
    init() {
        title = ""
        subTitle = ""
        icon = ""
        correctRate = 0
        submit = 0
        starCount = 0
    }
}

struct ModelQuizList: Codable {
    var items: [ModelQuiz]
}
