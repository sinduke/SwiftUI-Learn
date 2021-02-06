//
//  ModelMessage.swift
//  CompleteProject
//
//  Created by kh on 2021/2/1.
//
import Foundation

struct ModelMessageList: Codable
{
    var items : [ModelMessage]
}

struct ModelMessage: Codable, Hashable
{
    var message : String
    var postDate : String
    var isFromUser : Int
    
    init()
    {
        message = ""
        postDate = ""
        isFromUser = 0
    }
}
