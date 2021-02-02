//
//  SubPageTestRow.swift
//  CompleteProject
//
//  Created by kh on 2021/2/1.
//

import SwiftUI

struct SubPageTestRow: View {
    var model: ModelQuiz
    var sequence: Int
    @State var isAnimating = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 0 )
                .frame(width: UIScreen.main.bounds.width - 100, height: 150)
            
            HStack {
                Spacer()
                Image(model.icon)
                    .padding(.trailing, 5)
                Spacer()
                
                VStack(alignment: .leading, spacing: 0, content: {
                    Text(model.title)
                        .modifier(MiddleTitle())
                    Text(model.subTitle)
                        .modifier(SmallText())
                        .padding(.bottom, 10)
                    HStack(alignment: .top, spacing: 0, content: {
                        VStack(alignment: .leading, spacing: 3, content: {
                            Text("Rate")
                                .modifier(SmallText())
                            Text("\(model.correctRate)%")
                                .modifier(RedNumber())
                            CommonStarList(level: model.starCount)
                                .padding(.top, 10)
                        })
                        .padding(.trailing, 10)
                        VStack(alignment: .leading, spacing: 3, content: {
                            Text("Amount")
                                .modifier(SmallText())
                            
                            Text("\(model.submit)")
                                .modifier(RedNumber())
                        })
                    })
                    .padding(.top, 10)
                })
                Spacer()
                Image("tlIconStart")
                    .offset(x: 0, y: 36)
                Spacer()
            }
        }
        .padding(.top, 10)
        .animation(Animation.spring().delay(0.3 + 0.1 * Double(sequence)))
        .opacity(isAnimating ? 1 : 0)
        .onAppear(){
            self.isAnimating = true
        }
    }
}

struct SubPageTestRow_Previews: PreviewProvider {
    static var previews: some View {
        var model = ModelQuiz()
        model.icon = "tlIconDesign1"
        model.title = "Quiz for Designing"
        model.subTitle = "834 questions in total"
        
        return SubPageTestRow(model: model, sequence: 1)
    }
}
