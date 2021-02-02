//
//  PageViewIndex.swift
//  CompleteProject
//
//  Created by kh on 2021/1/29.
//

import SwiftUI

struct PageViewIndex: View {
    @State var isAnimating = false
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    IndexTopBarPart()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(Animation.spring().delay(0.1))
                    IndexCategoryPartlist()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(Animation.spring().delay(0.2))
                    IndexClassListPart()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(Animation.spring().delay(0.3))
                    IndexTopicListPart()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(Animation.spring().delay(0.4))
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .padding(.top, 20)
            .onAppear() {
                self.isAnimating = true
            }
        }
    }
}

struct PageViewIndex_Previews: PreviewProvider {
    static var previews: some View {
        PageViewIndex()
    }
}
