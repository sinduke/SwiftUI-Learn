//
//  ModelTutorialList.swift
//  CompleteProject
//
//  Created by kh on 2021/1/29.
//

import Foundation

class ModelTutorialList: NSObject
{
    var items : [ModelTutorial]
    
    override init()
    {
        self.items = [ModelTutorial]()
        
        let itemTitles = ["Active Label Supporting Hashtags, Mentions, Links","A Circular Progress Bar","A Custom  TextField With A Switchable Icon","Render HTML And GIF With  UIWebView","Render HTML And Execute The Javascript.","Call The Native Code By Javascript","Create A Notebook By HTML5","Add A Point Annotation To MKMapView","Use The  Camera of MKMapView","Lightweight Swift Loading Activity","Android-like Toast With Very Simple Interface","Apple HUD (Volume, Ringer, Rotation,…)","Live Animated Alert View","Beautiful Animated Alert View","The Swift Apple Calendar Library","A custom Visual Calendar","A Nicer UI Component For Picking Date And Time","Customizable And Extensible Action Sheet","Give UIImageView The Ability To Focus On Faces","Create A Custom UITableViewCell"]
        
        for i in 0 ..< 12
        {
            let item = ModelTutorial()
            item.sequence = i + 1
            item.favoriteCount = Int.random(in: 12 ... 20)
            item.fireCount = Int.random(in: 120 ... 200)
            item.starCount = Int.random(in: 3 ... 5)
            item.title = itemTitles[Int.random(in: 0 ..< 19)]
            item.subTitle = "New accesories set"
            
            self.items.append(item)
        }
        
    }
}
