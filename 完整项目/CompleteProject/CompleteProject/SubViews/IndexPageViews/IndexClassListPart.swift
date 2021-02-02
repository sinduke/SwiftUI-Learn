//
//  IndexClassListPart.swift
//  CompleteProject
//
//  Created by kh on 2021/1/29.
//

import SwiftUI

struct IndexClassListPart: View {
    
    @EnvironmentObject var status: ModelStatus
    @State var shouldPushClassList = false
    
    var classImageList = ["homeClassIconXcode", "homeClassIconSwift", "homeClassIconGithub", "homeClassIconXcode5", "homeClassIconPhotoshop", "homeClassIconIllustrator", "homeClassIconPhotoshopScript", "homeClassIconPhotoshopCS5", "homeClassIconExcel"]
    
    var classNameList = ["iOS Programming", "Swift Programming", "Advanced \niOS Programming", "Objective-C\nProgramming", "Photoshop Tutorials", "Illustartor Tutorials", "Photoshop Script\nTutorials", "Photoshop CS5\nTutorials", "Excel Tutorials"]
    var bgImageName = "homeClassItemBg"
    
    var body: some View {
        VStack {
            HStack {
                Text("Class List")
                    .font(.system(size: 16))
                    .padding(.leading, 20)
                    .foregroundColor(Color.init(red: 0.4, green: 0.4, blue: 0.4))
                    .offset(x: 0, y: 16)
                Spacer()
            }
            ScrollView(Axis.Set.horizontal, showsIndicators: true) {
                NavigationLink(destination: PageClassList(), isActive: $shouldPushClassList) {
                    
                    HStack {
                        ForEach(0 ..< classNameList.count) { item in
                            ZStack {
                                Image(self.classImageList[item])
                                Text(self.classNameList[item])
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14))
                                    .multilineTextAlignment(.center)
                                    .offset(x: 0, y: 40)
                            }
                            .background(Image(self.bgImageName).resizable())
                            .onTapGesture {
                                self.status.temStringValue = self.classNameList[item]
                                self.shouldPushClassList = true
                            }
                        }
                    }
                    
                }
                .padding(Edge.Set.init(arrayLiteral: .top), 10)
            }
            .padding(.leading, 20)
        }
        .padding(.top, 4)
    }
}

struct IndexClassListPart_Previews: PreviewProvider {
    static var previews: some View {
        IndexClassListPart()
    }
}
