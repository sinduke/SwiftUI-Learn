//
//  IndexTopBarPart.swift
//  CompleteProject
//
//  Created by kh on 2021/1/28.
//

import SwiftUI

struct IndexTopBarPart: View {
    @State private var tutorialName: String = ""
    @State var isActive = false
    @State var shouldShowAlert = false
    
    let dismissButton = Alert.Button.default(Text("OK")) {}
    
    var alert: Alert {
        Alert(title: Text("Alert"), message: Text("Please input keyword first"), dismissButton: dismissButton)
    }
    
    var body: some View {
        HStack {
            NavigationLink(destination: HistoryTutorialsView()) {
                Image(systemName: "list.bullet")
                    .font(.system(size: 22))
                    .foregroundColor(Color.gray)
            }
            Spacer().frame(width: 20)
            ZStack(alignment: Alignment.trailing) {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 1)
                    .fill(Color.init(red: 0.9, green: 0.9, blue: 0.9))
                    .frame(height: 30)
                TextField("Tutorial name", text: $tutorialName)
                    .padding(5)
                    .cornerRadius(5)
                    .font(.system(size: 14))
                NavigationLink(
                    destination: FilterTutorialsView(keyword: self.tutorialName),
                    isActive: $isActive,
                    label: {
                        Text("")
                    })
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 12))
                    .foregroundColor(Color.gray)
                    .padding(.trailing, 10)
                    .onTapGesture {
                        if self.tutorialName.isEmpty {
                            self.shouldShowAlert = true
                        } else {
                            self.isActive = true
                            self.shouldShowAlert = false
                        }
                    }
                    .alert(isPresented: $shouldShowAlert, content: {
                        alert
                    })
            }
            Spacer()
                .frame(width: 20)
            
            NavigationLink(destination: PageMessagesView()) {
                Image(systemName: "3.circle.fill")
                    .foregroundColor(.red)
                    .font(.system(size: 24))
            }
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))
    }
}

struct IndexTopBarPart_Previews: PreviewProvider {
    static var previews: some View {
        IndexTopBarPart()
    }
}

