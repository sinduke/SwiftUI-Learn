//
//  HistoryTutorialsView.swift
//  CompleteProject
//
//  Created by kh on 2021/1/29.
//

import SwiftUI

struct HistoryTutorialsView: View {
    var tutorialList = ModelTutorialList()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            SubPageTopTitle(title: "Recent tutorials", subTitle: "100 Tutorials in the list.")
            ScrollView {
                ForEach(tutorialList.items, id: \.self) { item in
                    NavigationLink(
                        destination: PageTutorialDetail(),
                        label: {
                            TutorialRow(tutorial: item)
                        })
                }
            }
            .padding(.top, 20)
            .offset(x: 30, y: 0)
        }
        .modifier(SubPageContainer())
    }
}

struct HistoryTutorialsView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryTutorialsView()
    }
}


