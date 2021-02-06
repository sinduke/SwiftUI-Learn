//
//  PageAssistant.swift
//  CompleteProject
//
//  Created by kh on 2021/2/1.
//

import SwiftUI

struct PageAssistant: View
{
    @State private var newMessage : String = ""
    @State private var isPresented : Bool = false
    @State private var isAnimating : Bool = false
    
    @ObservedObject var model = FetchModelMessageList()
    
    var alert: Alert
    {
        Alert(title: Text("Please input something."))
    }
    
    var body: some View
    {
        VStack(alignment: .leading, spacing: 10)
        {
            SubPageTopTitle(title: "Personal Consultant",
                            subTitle: "Please leave a message when you meet problem",
                            withArrow: false)
                .padding(.leading, 20)
                .padding(.bottom, 20)
            
            ScrollView
            {
                if(model.items.count == 0)
                {
                    Text("Loading...")
                        .modifier(LoadingText())
                }
                else
                {
                    ForEach(model.items, id:\.self)
                    { item in
                        SubPageComment(message: item.message, isFromUser: (item.isFromUser == 1) ? true : false)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                        
                    }
                }
            }
            .opacity(isAnimating ? 1 : 0)
            .animation(Animation.spring().delay(0.3))
            
            HStack
            {
                ZStack
                {
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(lineWidth: 1)
                        .fill(Color.black.opacity(0.2))
                        .frame(height:36)
                    
                    TextField("New message", text: $newMessage)
                        .font(.system(size: 16))
                        .padding(8)
                }
                .padding(.trailing, 5)
                
                Image(systemName: "return")
                    .font(.system(size: 14))
                    .foregroundColor(Color.gray)
                    .onTapGesture
                    {
                        if(self.newMessage == "")
                        {
                            self.isPresented.toggle()
                            return
                        }
                        var item = ModelMessage()
                        item.message = self.newMessage
                        item.isFromUser = 1
                        item.postDate = "2019-11-22"
                        self.model.items.insert(item, at: 0)
                }
            }
            .padding()
            .opacity(isAnimating ? 1 : 0)
            .animation(Animation.spring().delay(0.4))
            .alert(isPresented: $isPresented, content:
            {
                alert
            })
        }
        .modifier(SubPageContainer())
        .onAppear(perform: model.fetch)
        .onAppear
        {
            self.isAnimating = true
        }
    }
}

#if DEBUG
struct PageAssistant_Previews: PreviewProvider
{
    static var previews: some View
    {
        PageAssistant()
    }
}
#endif
