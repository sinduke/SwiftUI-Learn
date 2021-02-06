//
//  PageProfileDownload.swift
//  CompleteProject
//
//  Created by kh on 2021/2/6.
//

import SwiftUI

struct PageProfileDownload: View {
    @State private var isAnimating = false
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            SubPageTopTitle(title: "Download the resources", subTitle: "", withArrow: true)
            VStack(alignment: .leading, spacing: 30, content: {
                VStack(alignment: .leading, spacing: nil, content: {
                    Text("The app link:")
                        .modifier(RedNumber())
                    Text("https://itunes.apple.com/cn/app/id1392811165")
                        .modifier(RegularTitle())
                })
                .opacity(isAnimating ? 1 : 0)
                .animation(Animation.spring().delay(0.3))
                VStack(alignment: .leading, spacing: nil, content: {
                    Text("The resource link:")
                        .modifier(RedNumber())
                    Text("https://github.com/fzhlee")
                        .modifier(RegularTitle())
                })
                .opacity(isAnimating ? 1 : 0)
                .animation(Animation.spring().delay(0.4))
                VStack(alignment: .leading, spacing: nil, content: {
                    Text("Website:")
                        .modifier(RedNumber())
                    Text("https://www.hdjc8.com")
                        .modifier(RegularTitle())
                })
                .opacity(isAnimating ? 1 : 0)
                .animation(Animation.spring().delay(0.5))
                VStack(alignment: .leading, spacing: nil, content: {
                    Text("Service QQ:")
                        .modifier(RedNumber())
                    Text("287612274")
                        .modifier(RegularTitle())
                })
                .opacity(isAnimating ? 1 : 0)
                .animation(Animation.spring().delay(0.6))
            })
            .padding(.top, 10)
            .padding(.leading, 30)
            Spacer()
        })
        .modifier(SubPageContainer())
        .onAppear() {
            self.isAnimating = true
        }
    }
}

//struct PageProfileDownload: View
//{
//    @State private var isAnimating = false
//
//    var body: some View
//    {
//        VStack(alignment: .leading, spacing: 0)
//        {
//            SubPageTopTitle(title: "Download the resources", subTitle: "", withArrow: true)
//
//            VStack(alignment: .leading, spacing: 30)
//            {
//                VStack(alignment: .leading)
//                {
//                    Text("The app link:")
//                        .modifier(RedNumber())
//
//                    Text("https://itunes.apple.com/cn/app/id1392811165")
//                        .modifier(RegularTitle())
//                }
//                .opacity(isAnimating ? 1 : 0)
//                .animation(Animation.spring().delay(0.3))
//
//                VStack(alignment: .leading)
//                {
//                    Text("The resource link:")
//                        .modifier(RedNumber())
//
//                    Text("https://github.com/fzhlee")
//                        .modifier(RegularTitle())
//                }
//                .opacity(isAnimating ? 1 : 0)
//                .animation(Animation.spring().delay(0.4))
//
//                VStack(alignment: .leading)
//                {
//                    Text("Website:")
//                        .modifier(RedNumber())
//
//                    Text("http://www.hdjc8.com")
//                        .modifier(RegularTitle())
//                }
//                .opacity(isAnimating ? 1 : 0)
//                .animation(Animation.spring().delay(0.5))
//
//                VStack(alignment: .leading)
//                {
//                    Text("Service QQ:")
//                        .modifier(RedNumber())
//
//                    Text("3068527144")
//                        .modifier(RegularTitle())
//                }
//                .opacity(isAnimating ? 1 : 0)
//                .animation(Animation.spring().delay(0.6))
//            }
//            .padding(.top, 10)
//            .padding(.leading, 30)
//
//            Spacer()
//        }
//        .modifier(SubPageContainer())
//        .onAppear
//        {
//            self.isAnimating = true
//        }
//    }
//}

#if DEBUG
struct PageProfileDownload_Previews: PreviewProvider
{
    static var previews: some View
    {
        PageProfileDownload()
    }
}
#endif
