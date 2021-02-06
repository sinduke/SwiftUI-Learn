//
//  SubPageComment.swift
//  CompleteProject
//
//  Created by kh on 2021/2/2.
//

import SwiftUI

struct SubPageComment: View
{
    var message : String
    var isFromUser : Bool
    
    private let assistantColor : Color = Color(red: 83/255, green: 196/255, blue: 249/255)
    private let assistantColor2 : Color = Color.init(red: 255/255, green: 123/255, blue: 109/255)
    
    var body: some View
    {
        HStack(alignment: .center, spacing: 0)
        {
            if(isFromUser)
            {
                Image(systemName: "person.crop.circle")
                    .foregroundColor(assistantColor2)
                    .font(.system(size: 26))
                    .padding(.trailing, 5)
                
                Image(systemName: "arrowtriangle.left.fill")
                    .foregroundColor(assistantColor2)
                    .font(.system(size: 18))
                
                Text(message)
                    .padding()
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                    .background(RoundedRectangle(cornerRadius: 20, style: RoundedCornerStyle.circular).fill(assistantColor2))
                
                Spacer()
                
            }
            else
            {
                Spacer()
                Text(message)
                    .padding()
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                    .clipped()
                    .background(RoundedRectangle(cornerRadius: 20, style: RoundedCornerStyle.circular).fill(assistantColor))
                
                Image(systemName: "arrowtriangle.right.fill")
                    .foregroundColor(assistantColor)
                    .font(.system(size: 18))
                
                Image(systemName: "person.crop.circle")
                .foregroundColor(assistantColor)
                .font(.system(size: 26))
                .padding(.leading, 5)
            }
        }
    }
}

#if DEBUG
struct SubPageComment_Previews: PreviewProvider
{
    static var previews: some View
    {
        SubPageComment(message: "SwiftUI is a user interface toolkit that lets us design apps in a declarative way. That’s a fancy way of saying that we tell SwiftUI how we want our UI to look and work, and it figures out how to make that happen as the user interacts with it.", isFromUser: false)
    }
}
#endif
