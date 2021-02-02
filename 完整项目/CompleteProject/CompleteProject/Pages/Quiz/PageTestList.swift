//
//  PageTestList.swift
//  CompleteProject
//
//  Created by kh on 2021/2/1.
//

import SwiftUI

struct PageTestList: View {
    
    @ObservedObject var model = FetchModelQuizList()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0, content: {
                SubPageTopTitle(title: "Test Questions", subTitle: "Thousends of questions to enhance your skills.", withArrow: false)
                
                if(model.items.count > 0) {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        ForEach(0 ..< model.items.count) {item in
                            NavigationLink(
                                destination: PageTestDetail(),
                                label: {
                                    SubPageTestRow(model: self.model.items[item], sequence: item)
                                })
                        }
                    })
                }
                else {
                    Spacer()
                }
                
            })
            .modifier(SubPageContainer())
        }
        .onAppear(perform: {
            model.fetch()
        })
    }
}

struct PageTestList_Previews: PreviewProvider {
    static var previews: some View {
        PageTestList()
    }
}
