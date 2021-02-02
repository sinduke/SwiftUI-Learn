//
//  PageCategories.swift
//  CompleteProject
//
//  Created by kh on 2021/1/29.
//

import SwiftUI

struct PageCategories: View {
    var title: String = ""
    private let labels = ["Introduction[33]","About Xcode[12]","View layout[18]","Introduction[21]","Responding to events[12]","Advanced state[33]","Swift Syntax[12]","List and Forms[25]","Multi-media Programming[38]","Networking[22]","ViewControllers[19]","Using storyboard[26]","Using CoreData[26]","Maching Learning[29]","Animation[23]","Objective-C Basic[14]","Multi-treading[23]","Touch and Gestures[33]","SwiftUI DSL Basic[18]","Navigation[9]"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            SubPageTopTitle(title: "\(title) labels", subTitle: "382 tutorials is this list.")
            VStack(alignment: .leading, spacing: 12) {
                ForEach(0 ..< labels.count) { number in
                    if (number % 2 == 0) {
                        CategoryRowView(firstLabel: self.labels[number], secondLabel: self.labels[number + 1], sequence: number)
                    }
                }
            }
            .padding(.top, 30)
            .padding(.leading, 30)
            Spacer()
        }
        .modifier(SubPageContainer())
    }
}

struct PageCategories_Previews: PreviewProvider {
    static var previews: some View {
        PageCategories()
    }
}

struct CategoryRowView: View {
    var firstLabel = ""
    var secondLabel = ""
    var sequence = 1
    @State private var isAnimating = false
    var body: some View {
        HStack {
            NavigationLink(destination: PageTutorialList(title: firstLabel)) {
                Text(firstLabel)
                    .modifier(CategoryLabel())
            }
            NavigationLink(destination: PageTutorialList(title: secondLabel)) {
                Text(secondLabel)
                    .modifier(CategoryLabel())
            }
        }
        .opacity(self.isAnimating ? 1 : 0)
        .animation(Animation.spring().delay(0.2 + 0.05 * Double(sequence)))
        .onAppear() {
            self.isAnimating = true
        }
    }
}
