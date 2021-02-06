//
//  PageProfileClearCache.swift
//  CompleteProject
//
//  Created by kh on 2021/2/6.
//

import SwiftUI

struct PageProfileClearCache: View {
    @State private var totalSize: Int = 0
    @State private var showingAlert = false
    @State private var isAnimating = false
    var alert: Alert {
        Alert(title: Text("Success to clear cache."))
    }
    
    var body: some View {
        VStack {
            SubPageTopTitle(title: "Clear the cache", subTitle: "", withArrow: true)
            VStack {
                Spacer()
                Image("mpIconSetting")
                    .opacity(isAnimating ? 1 :0)
                    .animation(Animation.spring().delay(0.3))
                Button("Tap me to clear cache") {
                    self.clearCache()
                    self.showingAlert.toggle()
                }
                .modifier(RedNumber())
                .opacity(isAnimating ? 1 :0)
                .animation(Animation.spring().delay(0.4))
                Text("Total size: \(totalSize/1024) KB")
                    .modifier(SmallText())
                    .padding(.top, 20)
                    .opacity(isAnimating ? 1 :0)
                    .animation(Animation.spring().delay(0.5))
                Spacer()
            }
        }
        .modifier(SubPageContainer())
        .alert(isPresented: $showingAlert, content: {
            alert
        })
        .onAppear() {
            self.sumFolderSize()
            self.isAnimating = true
        }
    }
    
    func getSize(filePath: String) -> Int {
        var fileSize: UInt64 = 0
        do {
            let attr = try FileManager.default.attributesOfItem(atPath: filePath)
            fileSize = attr[FileAttributeKey.size] as! UInt64
            
        } catch  {
            print("Error: \(error)")
        }
        return Int(fileSize)
    }
    
    func sumFolderSize() {
        totalSize = 0
        let fileManager = FileManager.default
        let folder = NSHomeDirectory() + "/Documents/"
        let files: [String]? = fileManager.subpaths(atPath: folder)
        
        for file in files! {
            let fileSize = getSize(filePath: folder + file)
            totalSize += fileSize
        }
    }
    func clearCache() {
        let fileManager = FileManager.default
        let folder = NSHomeDirectory() + "/Documents/"
        let files: [String]? = fileManager.subpaths(atPath: folder)
        
        for file in files! {
            do {
                try fileManager.removeItem(atPath: folder + "/\(file)")
            } catch {
                print("Failed to clear cache.")
            }
        }
        self.sumFolderSize()
    }
}

struct PageProfileClearCache_Previews: PreviewProvider {
    static var previews: some View {
        PageProfileClearCache()
    }
}
