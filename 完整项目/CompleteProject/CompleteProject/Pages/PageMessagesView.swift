//
//  PageMessagesView.swift
//  CompleteProject
//
//  Created by kh on 2021/1/29.
//

import SwiftUI

struct PageMessagesView: View
{
    private let colors = [Color.orange, Color.purple, Color.red, Color.green, Color.blue]
    @ObservedObject var model = FetchModelNewsList()
    
    var body: some View
    {
        VStack(alignment: .leading, spacing: 0)
        {
            SubPageTopTitle(title: "Messages", subTitle: "100 Messages in the list.")
                
            ScrollView()
            {
                if(model.items.count == 0)
                {
                    Text("Loading...")
                    .modifier(LoadingText())
                }
                else
                {
                    ForEach(0 ..< model.items.count)
                    { item in
                        SubPageMessageRow(model: self.model.items[item], color: self.colors.randomElement()!, sequence: item)
                    }
                    .padding(10)
                }
            }
            .padding(.leading, 25)
        }
        .modifier(SubPageContainer())
        .onAppear(perform: model.fetch)
    }
}

struct SubPageMessageRow: View
{
    var model : ModelNews
    var color : Color = Color.purple
    var sequence : Int
    @State var isAnimating = false
    
    var body: some View
    {
        HStack
        {
            Rectangle()
                .fill(Color.gray)
                .frame(minWidth: 1, idealWidth: 1, maxWidth: 1, minHeight: 120, idealHeight: 100, maxHeight: 1000, alignment: .leading)
        
            HStack(alignment: .top, spacing: 0)
            {
                Circle()
                    .fill(color)
                    .frame(width: 15, height: 15, alignment: .center)
                    .offset(x: -16, y: 2)
                
                VStack(alignment: .leading, spacing: 10)
                {
                    HStack(alignment: .top)
                    {
                        Text(model.title)
                            .font(.system(size: 15))
                            .modifier(RegularTitle())
                        
                        Spacer()
                        
                        Image(systemName: "calendar")
                            .modifier(SmallText())
                            .offset(x: 0, y: 5)
                        
                        Text(model.postDate)
                            .modifier(SmallText())
                    }
                    Text(model.subTitle)
                        .modifier(SmallText())
                }
            }
        }
        .opacity(isAnimating ? 1 : 0)
        .animation(Animation.spring().delay(0.3 + 0.1 * Double(sequence)))
        .padding(.bottom, -10)
        .onAppear
        {
            self.isAnimating = true
        }
    }
}

#if DEBUG
struct PageMessageList_Previews: PreviewProvider
{
    static var previews: some View
    {
        PageMessagesView(model: FetchModelNewsList())
    }
}
#endif
