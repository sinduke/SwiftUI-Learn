//
//  SubPageProfileStatic.swift
//  CompleteProject
//
//  Created by kh on 2021/2/6.
//

import SwiftUI

struct SubPageProfileStatic: View {
    var body: some View {
        HStack {
            ZStack(alignment: .bottomLeading) {
                Image("mpStaticBgBlue")
                Text("20")
                    .modifier(StaticText())
            }
            ZStack(alignment: .bottomLeading) {
                Image("mpStaticBgPurple")
                Text("12")
                    .modifier(StaticText())
            }
            ZStack(alignment: .bottomLeading) {
                Image("mpStaticBgRed")
                Text("122")
                    .modifier(StaticText())
            }
        }
    }
}

struct SubPageProfileStatic_Previews: PreviewProvider {
    static var previews: some View {
        SubPageProfileStatic()
    }
}
