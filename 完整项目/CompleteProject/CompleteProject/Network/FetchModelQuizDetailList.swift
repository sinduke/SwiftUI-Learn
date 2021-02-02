//
//  FetchModelQuizDetailList.swift
//  CompleteProject
//
//  Created by kh on 2021/2/1.
//

import Foundation

class FetchModelQuizDetailList: ObservableObject {
    @Published var item: ModelQuizDetail = ModelQuizDetail()
    @Published var items: [ModelQuizDetail] = []
    
    static let url = URL(string: "http://www.hdjc8.com/json/quizDetail.json")!
    func fetch() {
        URLSession.shared.dataTask(with: FetchModelQuizDetailList.url) {(data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            let jsonDecoder = JSONDecoder()
            let modelObject = try? jsonDecoder.decode(ModelQuizDetailList.self, from: data)
            
            DispatchQueue.main.async {
                self.items = modelObject!.items
                self.getItem()
            }
        }
        .resume()
    }
    
    func getItem() {
        self.item = self.items.randomElement()!
    }
    
}
