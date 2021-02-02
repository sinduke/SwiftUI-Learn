//
//  FetchModelNewsList.swift
//  CompleteProject
//
//  Created by kh on 2021/2/1.
//

import SwiftUI

class FetchModelNewsList: ObservableObject
{
    @Published var items: [ModelNews] = []
    static let url = URL(string: "http://www.hdjc8.com/json/news.json")!
    
    func fetch()
    {
        URLSession.shared.dataTask(with: FetchModelNewsList.url)
        { (data, response, error) in
            guard let data = data, error == nil else
            {
                return
            }
            
            let jsonDecoder = JSONDecoder()
            let modelObject = try? jsonDecoder.decode(ModelNewsList.self, from: data)
            
            DispatchQueue.main.async
            {
                self.items = modelObject!.items
                print(self.items)
            }
            
        }
        .resume()
    }
}

