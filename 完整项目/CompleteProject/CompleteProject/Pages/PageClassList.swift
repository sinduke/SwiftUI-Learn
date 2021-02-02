//
//  PageClassList.swift
//  CompleteProject
//
//  Created by kh on 2021/1/29.
//

import SwiftUI

struct PageClassList: View {
    @EnvironmentObject var status: ModelStatus
    @State var tutorialList = ModelTutorialList()
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            SubPageTopTitle(title: status.temStringValue, subTitle: "382 tutorials in this list.")
            SubPageChapterList(parentView: self)
                .padding(Edge.Set.init(arrayLiteral: .top, .bottom), 20)
                .offset(x: 27, y: 0)
            ScrollView() {
                ForEach(tutorialList.items, id:\.self) { item in
                    NavigationLink(
                        destination: PageTutorialDetail(),
                        label: {
                            TutorialRow(tutorial: item)
                        })
                }
            }
            .offset(x: 30, y: 0)
        }
        .modifier(SubPageContainer())
    }
    func resetTutorialsList() {
        self.tutorialList = ModelTutorialList()
    }
}

struct PageClassList_Previews: PreviewProvider {
    static var previews: some View {
        let globalModel = ModelStatus()
        globalModel.temStringValue = "iOS Programming"
        return PageClassList().environmentObject(globalModel)
    }
}

struct SubPageChapterList: View {
    var parentView: PageClassList
    @State var selectedItem = 1
    private let chapterTitles = ["Basic", "UIView", "Controllers", "Controls", "Tables", "Animation", "Data", "Network", "Advanced"]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack(spacing: 0) {
                ForEach(1 ..< 10) { item in
                    ZStack(alignment: .leading, content: {
                        Image((item == self.selectedItem) ? "clClassActive" : "clClassInactive")
                        VStack(alignment: .leading, spacing: 10, content: {
                            Text("\(self.chapterTitles[item - 1])")
                                .font(.system(size: 15))
                            Text("\(item)")
                                .font(.system(size: 64))
                        })
                        .offset(x: 20, y: 0)
                        .foregroundColor((item == self.selectedItem) ? .white : .gray)
                    })
                    .onTapGesture {
                        self.selectedItem = item
                        self.parentView.resetTutorialsList()
                    }
                }
            }
        })
    }
}
