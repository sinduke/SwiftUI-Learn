//
//  SubPageProfileRow.swift
//  CompleteProject
//
//  Created by kh on 2021/2/6.
//

import SwiftUI

struct SubPageProfileRow: View {
    var model: ModelProfile
    var body: some View {
        HStack {
            Image(model.icon)
            Text(model.title)
                .modifier(RegularTitle())
            Spacer()
            if model.messageCount > 0 {
                ZStack {
                    Image("mpIconPointBrown")
                    Text("\(model.messageCount)")
                        .foregroundColor(.white)
                        .modifier(RegularTitle())
                }
            }
            Image("mpIconArrowRight")
        }
        .padding(.init(arrayLiteral: .top, .bottom), 6)
    }
}

struct SubPageProfileRow_Previews: PreviewProvider {
    static var previews: some View {
        let model = ModelProfile(icon: "mpIconFavorite", title: "tutorials", messageCount: 9)
        SubPageProfileRow(model: model)
    }
}
