//
//  ContentView.swift
//  CompleteProject
//
//  Created by kh on 2021/1/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView() {
            PageViewIndex()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            PageTestList()
                .tabItem {
                    Image(systemName: "rectangle.and.pencil.and.ellipsis")
                    Text("Quiz")
                }
            
            PageAssistant()
                .tabItem {
                    Image(systemName: "rectangle.3.offgrid.bubble.left")
                    Text("Help")
                }
            PageProfile()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Profile")
                }
        }
        .accentColor(Color.init(red: 255/255, green: 123/255, blue: 109/255))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
