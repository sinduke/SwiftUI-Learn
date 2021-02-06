//
//  SubPageProfileVipSet.swift
//  CompleteProject
//
//  Created by kh on 2021/2/6.
//

import SwiftUI

struct SubPageProfileVipSet: View {
    var item = ModelSubscription(itemType: "YEARLY", itemPrice: 25, itemDateRange: "365days")
    var isActive = false
    var body: some View {
        ZStack {
            if isActive {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 1)
                    .fill(Color.init(red: 255/255, green: 123/255, blue: 109/255))
                VStack(alignment: .center, spacing: CGFloat(10), content: {
                    Text(item.itemType)
                        .modifier(VipDateTitleEnable())
                    HStack(alignment: .firstTextBaseline, spacing: 5, content: {
                        Text("$")
                            .modifier(VipDateCurrencyEnable())
                        Text("\(item.itemPrice)")
                            .modifier(VipDatePriceEnable())
                    })
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                    
                    Text(item.itemDateRange)
                        .modifier(VipDateRangeEnable())
                    
                })
            } else {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 1)
                    .fill(Color.black.opacity(0.3))
                VStack(alignment: .center, spacing: CGFloat(10), content: {
                    Text(item.itemType)
                        .modifier(VipDateTitleDisable())
                    HStack(alignment: .firstTextBaseline, spacing: 5, content: {
                        Text("$")
                            .modifier(VipDateCurrencyDisable())
                        Text("\(item.itemPrice)")
                            .modifier(VipDatePriceDisable())
                    })
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                Text(item.itemDateRange)
                    .modifier(VipDateRangeDisable())
                })
            }
        }
    }
}

struct SubPageProfileVipSet_Previews: PreviewProvider {
    static var previews: some View {
        SubPageProfileVipSet()
    }
}
