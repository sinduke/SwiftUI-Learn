//
//  FetchModelMessageList.swift
//  CompleteProject
//
//  Created by kh on 2021/2/2.
//

import SwiftUI

class FetchModelMessageList: ObservableObject
{
    @Published var items: [ModelMessage] = []
    static let url = URL(string: "http://www.hdjc8.com/json/message.json")!
    
    func fetch()
    {
        URLSession.shared.dataTask(with: FetchModelMessageList.url)
        { (data, response, error) in
            guard let data = data, error == nil else
            {
                return
            }
            
            let jsonDecoder = JSONDecoder()
            let modelObject = try? jsonDecoder.decode(ModelMessageList.self, from: data)
            
            DispatchQueue.main.async
            {
                self.items = modelObject!.items
                print(self.items)
            }
            
        }
        .resume()
    }
}
