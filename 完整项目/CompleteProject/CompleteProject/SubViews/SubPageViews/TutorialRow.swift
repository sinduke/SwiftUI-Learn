//
//  TutorialRow.swift
//  CompleteProject
//
//  Created by kh on 2021/1/29.
//

import SwiftUI

struct TutorialRow: View {
    var tutorial: ModelTutorial
    @State var isAnimating = false
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 10) {
                VStack {
                    if(tutorial.status == TutorialStatus.None) {
                        Image(systemName: "circle")
                            .modifier(RedNumberSmall())
                            .offset(x: 0, y: -20)
                    } else if (tutorial.status == TutorialStatus.Completed) {
                        Image(systemName: "circle.fill")
                            .modifier(RedNumberSmall())
                            .offset(x: 0, y: -20)
                    } else {
                        Image(systemName: "circle.lefthalf.fill")
                            .modifier(RedNumberSmall())
                            .offset(x: 0, y: -20)
                    }
                    
                }
                VStack(alignment: .leading, spacing: 0) {
                    Text(tutorial.title)
                        .modifier(RegularTitle())
                    Text(tutorial.subTitle)
                        .modifier(SubTitle())
                    
                    HStack {
                        HStack(alignment: .center, spacing: 2) {
                            ForEach( 0 ..< tutorial.starCount) {_ in
                                Image(systemName: "star.fill")
                            }
                            
                            ForEach(tutorial.starCount ..< 5) {_ in
                                Image(systemName: "star")
                            }
                        }
                        Spacer()
                        HStack {
                            Image(systemName: "flame.fill")
                            Text("\(tutorial.fireCount)")
                        }
                        HStack {
                            Image(systemName: "hand.thumbsup.fill")
                            Text("\(tutorial.favoriteCount)")
                        }
                        .padding(.leading, 10)
                    }
                    .padding(.top, 18)
                    .font(.system(size: 11))
                    .modifier(SubTitle())
                }
                .padding(.top, 10)
                .padding(.bottom, 8)
            }
            Rectangle()
                .fill(Color.black.opacity(0.1))
                .frame(height: 1)
        }
        .frame(width: UIScreen.main.bounds.width - 80)
        .opacity(self.isAnimating ? 1 : 0)
        .offset(x: self.isAnimating ? 0 : 100, y: 0)
        .animation(Animation.spring().delay(0.3 + 0.1 * Double(tutorial.sequence)))
        .onAppear(perform: {
            self.isAnimating = true
        })
    }
}


#if DEBUG
struct TutorialRow_Previews: PreviewProvider {
    static var previews: some View {
        let model = ModelTutorial()
        model.title = "Getting started with SwiftUI"
        model.subTitle = "New accesories set"
        
        return TutorialRow(tutorial: model)
    }
}
#endif

