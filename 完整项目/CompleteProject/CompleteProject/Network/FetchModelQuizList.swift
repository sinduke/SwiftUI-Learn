//
//  FetchModelQuizList.swift
//  CompleteProject
//
//  Created by kh on 2021/2/1.
//

import SwiftUI

class FetchModelQuizList: ObservableObject {
    @Published var items: [ModelQuiz] = []
    static let url = URL(string: "http://www.hdjc8.com/json/quiz.json")!
    
    func fetch() {
        URLSession.shared.dataTask(with: FetchModelQuizList.url) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            let jsonDecoder = JSONDecoder()
            let modelObject = try? jsonDecoder.decode(ModelQuizList.self, from: data)
            
            DispatchQueue.main.async {
                self.items = modelObject!.items
            }
        }
        .resume()
    }
}
