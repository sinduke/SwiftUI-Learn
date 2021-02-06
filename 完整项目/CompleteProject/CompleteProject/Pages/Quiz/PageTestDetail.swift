//
//  PageTestDetail.swift
//  CompleteProject
//
//  Created by kh on 2021/2/1.
//

import SwiftUI

struct PageTestDetail: View {
    @ObservedObject var model = FetchModelQuizDetailList()
    @State var selectedItem = -1
    @State var totalCorrect = 0
    @State var totalInCorrect = 0
    
    @State var isAnimating = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16, content: {
            SubPageTopTitle(title: "Back", subTitle: "", withArrow: true)
            
            HStack {
                Text(model.item.question)
                    .modifier(MiddleTitle())
                    .lineLimit(nil)
                    .padding(.bottom, 15)
                    .opacity(self.isAnimating ? 1 : 0)
                    .animation(Animation.spring().delay(0.3))
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 20, content: {
                ForEach(0 ..< self.model.item.options.count) { number in
                    Text("\(number + 1). \(self.model.item.options[number])")
                        .multilineTextAlignment(.leading)
                        .modifier(RegularTitleOption(isHighlight: self.selectedItem == (number + 1)))
                        .onTapGesture {
                            self.selectedItem = number + 1
                        }
                        .opacity(self.isAnimating ? 1 : 0)
                        .animation(Animation.spring().delay(0.3))
                }
            })
            HStack(spacing: 20, content: {
                Text("Correct: \(totalCorrect)")
                Text("Incorrect: \(totalInCorrect)")
            })
            .opacity(self.isAnimating ? 1 : 0)
            .animation(Animation.spring().delay(0.7))
            .modifier(RegularTitle())
            .padding(.top, 25)
            
            HStack(spacing: 20, content: {
                Button(action: {
                    if(self.model.item.answer == self.selectedItem) {
                        self.totalCorrect += 1
                    } else {
                        self.totalInCorrect += 1
                    }
                    self.selectedItem = -1
                    self.model.getItem()
                }, label: {
                    Text(" Submit ")
                })
                .modifier(CommonButton(isEnable: self.selectedItem > -1))
                .disabled(self.selectedItem == -1)
                
                Button(" Share ") {
                    print("Share the question.")
                }
                .modifier(CommonButton(isEnable: true))
            })
            .opacity(self.isAnimating ? 1 : 0)
            .animation(Animation.spring().delay(0.8))
            Spacer()
        })
        .modifier(SubPageContainer())
        .onAppear(perform: {
            model.fetch()
        })
        .onAppear() {
            self.isAnimating = true
        }
    }
}

struct PageTestDetail_Previews: PreviewProvider {
    static var previews: some View {
        PageTestDetail()
    }
}
