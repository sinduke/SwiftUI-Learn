//
//  PageProfile.swift
//  CompleteProject
//
//  Created by kh on 2021/2/1.
//

import SwiftUI
import StoreKit

struct PageProfile: View {
    @State var isAnimating = false
    private var profileList = ModelProfileList()
    private var scaleFactor = { () -> Double in
        let screenWidth = UIScreen.main.bounds.width
        if(screenWidth <= 375) {
            return Double(screenWidth / 420)
        }
        return 1.0
    }
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Image("rlAvarta")
                }
                .opacity(isAnimating ? 1 : 0)
                .animation(Animation.spring().delay(0))
                HStack {
                    VStack(alignment: .leading, spacing: 0, content: {
                        Text("Sinduke")
                            .font(.system(size: 32))
                            .opacity(isAnimating ? 1 : 0)
                            .animation(Animation.spring().delay(0.1))
                        Text("I have 10 cool coins")
                            .font(.system(size: 16))
                            .foregroundColor(.orange)
                            .opacity(isAnimating ? 1 : 0)
                            .animation(Animation.spring().delay(0.2))
                    })
                    .padding()
                    Spacer()
                }
                
                SubPageProfileStatic()
                    .opacity(isAnimating ? 1 : 0)
                    .animation(Animation.spring().delay(0.3))
                
                ScrollView {
                    NavigationLink(destination: PageProfileSubscription()) {
                        SubPageProfileRow(model: profileList.items[0])
                            .opacity(isAnimating ? 1 : 0)
                            .animation(Animation.spring().delay(0.4))
                    }
                    NavigationLink(destination: PageTutorialList(title: "Myfavorites")) {
                        SubPageProfileRow(model: profileList.items[1])
                            .opacity(isAnimating ? 1 : 0)
                            .animation(Animation.spring().delay(0.5))
                    }
                    NavigationLink(destination: PageProfileSkills()) {
                        SubPageProfileRow(model: profileList.items[2])
                            .opacity(isAnimating ? 1 : 0)
                            .animation(Animation.spring().delay(0.6))
                    }
                    NavigationLink(destination: PageProfileDownload()) {
                        SubPageProfileRow(model: profileList.items[3])
                            .opacity(isAnimating ? 1 : 0)
                            .animation(Animation.spring().delay(0.7))
                    }
                    NavigationLink(destination: PageProfileClearCache()) {
                        SubPageProfileRow(model: profileList.items[4])
                            .opacity(isAnimating ? 1 : 0)
                            .animation(Animation.spring().delay(0.8))
                    }
                    SubPageProfileRow(model: profileList.items[5]).onTapGesture {
                        if #available(iOS 14.0, *) {
                                if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                                    SKStoreReviewController.requestReview(in: scene)
                                }
                        } else if let url = URL(string: "itms-apps://itunes.app.com/app/id1392811165") {
                                UIApplication.shared.canOpenURL(url)
                            }
                    }
                    .opacity(isAnimating ? 1 : 0)
                    .animation(Animation.spring().delay(0.9))
                }
                .padding()
            }
            .scaleEffect(CGFloat(scaleFactor()))
            .edgesIgnoringSafeArea(.all)
            .onAppear() {
                self.isAnimating = true
            }
        }
        .padding()
    }
}

struct PageProfile_Previews: PreviewProvider {
    static var previews: some View {
        PageProfile()
    }
}
