//
//  CommonStarList.swift
//  CompleteProject
//
//  Created by kh on 2021/2/1.
//

import SwiftUI

struct CommonStarList: View {
    var level = 4
    var body: some View {
        HStack(alignment: .center, spacing: 0, content: {
            ForEach( 0 ..< level ) { item in
                Image(systemName: "star.fill")
                    .modifier(LittleStar())
            }
            
            ForEach(0 ..< (5 - level)){ item in
                Image(systemName: "star")
                    .modifier(LittleStar())
            }
        })
    }
}

struct CommonStarList_Previews: PreviewProvider {
    static var previews: some View {
        CommonStarList()
    }
}
