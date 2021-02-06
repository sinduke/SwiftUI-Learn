//
//  PageProfileSubscription.swift
//  CompleteProject
//
//  Created by kh on 2021/2/6.
//

import SwiftUI

struct PageProfileSubscription: View {
    @State private var selectedType = "YEARLY"
    @State private var selectedDateRange = "365 days"
    
    private var model = ModelSubscriptionList()
    
    @State var isAnimating = false
    
    var body: some View {
        VStack {
            SubPageTopTitle(title: "Go Premium", subTitle: "", withArrow: true)
            HStack(alignment: .center, spacing: 10, content: {
                ForEach (model.items, id: \.self) { item in
                    SubPageProfileVipSet(item: item, isActive: self.selectedType == item.itemType)
                        .onTapGesture {
                            self.selectedType = item.itemType
                            self.selectedDateRange = item.itemDateRange
                        }
                }
            })
            .opacity(isAnimating ? 1 : 0)
            .animation(Animation.spring().delay(0.3))
            .frame(width: UIScreen.main.bounds.width - 60, height: 160, alignment: .center)
            .padding(.top, 10)
            
            VStack(alignment: .leading, spacing: 10, content: {
                HStack {
                    Text("Your choice:")
                    Spacer()
                    Text("\(selectedType)")
                }
                .opacity(isAnimating ? 1 : 0)
                .animation(Animation.spring().delay(0.4))
                HStack {
                    Text("Date range:")
                    Spacer()
                    Text("\(selectedDateRange)")
                }
                .opacity(isAnimating ? 1 : 0)
                .animation(Animation.spring().delay(0.5))
                HStack {
                    Text("Unlock all tutorials")
                    Spacer()
                    Text("Yes")
                }
                .opacity(isAnimating ? 1 : 0)
                .animation(Animation.spring().delay(0.6))
                HStack {
                    Text("Personal consultant")
                    Spacer()
                    Text("Yes")
                }
                .opacity(isAnimating ? 1 : 0)
                .animation(Animation.spring().delay(0.7))
                HStack {
                    Text("Resources")
                    Spacer()
                    Text("Yes")
                }
                .opacity(isAnimating ? 1 : 0)
                .animation(Animation.spring().delay(0.8))
            })
            .frame(width: UIScreen.main.bounds.width - 60)
            .padding(.top, 20)
            .modifier(RegularTitle())
            Spacer()
            
            VStack {
                Button(" Purchase it ") {
                    print(" Puchase the selected item ")
                }
                .opacity(isAnimating ? 1 : 0)
                .animation(Animation.spring().delay(1.1))
                .font(.system(size: 20))
                .frame(width: UIScreen.main.bounds.width - 60, height: 50)
                .background(Color.init(red: 255/255, green: 123/255, blue: 109/255))
                .foregroundColor(.white)
                .cornerRadius(5)
                
                HStack {
                    Button("Restore transaction") {
                        print("Restore transaction")
                    }
                    Spacer()
                    Button("Privacy Policy") {
                        print("Privacy Policy")
                    }
                }
                .opacity(isAnimating ? 1 : 0)
                .animation(Animation.spring().delay(1.2))
                .frame(width: UIScreen.main.bounds.width - 60)
                .padding(.top, 10)
            }
            .modifier(RegularTitle())
            .onAppear() {
                self.isAnimating = true
            }
            Spacer()
        }
        .modifier(SubPageContainer())
    }
}

struct PageProfileSubscription_Previews: PreviewProvider {
    static var previews: some View {
        PageProfileSubscription()
    }
}
