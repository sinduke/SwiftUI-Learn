//
//  SubPageTopTitle.swift
//  CompleteProject
//
//  Created by kh on 2021/1/29.
//

import SwiftUI

struct SubPageTopTitle: View {
    var title: String = ""
    var subTitle: String = ""
    var withArrow = true
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var isAnimating = false
    
    var body: some View {
        HStack(alignment: .top) {
            if(withArrow) {
                Image(systemName: "arrow.left")
                    .font(.system(size: 20))
                    .offset(x: 0, y: 8)
                    .padding(.trailing, 5)
                    .opacity(self.isAnimating ? 1 : 0)
                    .animation(Animation.spring().delay(0.0))
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                    }
            }
            VStack(alignment: .leading, spacing:0) {
                Text(title)
                    .modifier(BigTitle())
                    .padding(.bottom, 5)
                    .opacity(self.isAnimating ? 1 : 0)
                    .animation(Animation.spring().delay(0.1))
                Text(subTitle)
                    .modifier(SubTitle())
                    .opacity(self.isAnimating ? 1 : 0)
                    .animation(Animation.spring().delay(0.2))
            }
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 40)
        .onAppear(){
            self.isAnimating = true
        }
    }
}
