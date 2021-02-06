//
//  CompleteProjectApp.swift
//  CompleteProject
//
//  Created by kh on 2021/1/28.
//

import SwiftUI

@main
struct CompleteProjectApp: App {
    var body: some Scene {
        WindowGroup {
            let globalModel = ModelStatus()
//            PageViewIndex().environmentObject(globalModel)
            ContentView().environmentObject(globalModel)
        }
    }
}
