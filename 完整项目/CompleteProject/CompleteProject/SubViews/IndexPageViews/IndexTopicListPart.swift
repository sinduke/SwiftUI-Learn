//
//  IndexTopicListPart.swift
//  CompleteProject
//
//  Created by kh on 2021/1/29.
//

import SwiftUI

struct IndexTopicListPart: View {
    
    let topicsImageList = ["homeTopicCoding1","homeTopicCoding2","homeTopicCoding3","homeTopicUI1", "homeTopicUI2", "homeTopicUI3", "homeTopicUI4", "homeTopicOffice1", "homeTopicOffice2"]
    let topicsNameList = ["SwiftUI tutorials", "iOS advanced programming", "Swift classical algorithm", "Photoshop creative toolbox", "Photoshop magical filters", "Illustrator painting", "Illustrator advanced skills", "Excel functions", "Excel data analysis"]
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular Topics")
                    .font(.system(size: 16))
                    .padding(.leading, 20)
                    .foregroundColor(Color.init(red: 0.4, green: 0.4, blue: 0.4))
                    .offset(x: 0, y: 10)
                Spacer()
            }
            ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0 ..< topicsNameList.count) { item in
                        NavigationLink(destination: PageTutorialList(title: "\(self.topicsNameList)")) {
                            Image(self.topicsImageList[item])
                        }
                        
                    }
                }
                .padding(.top, 10)
                .padding(.bottom, 10)
            }
            .padding(.leading, 20)
        }
    }
}

struct IndexTopicListPart_Previews: PreviewProvider {
    static var previews: some View {
        IndexTopicListPart()
    }
}
