//
//  IndexCategoryPartlist.swift
//  CompleteProject
//
//  Created by kh on 2021/1/29.
//

import SwiftUI

struct IndexCategoryPartlist: View {
    var body: some View {
        VStack {
            HStack {
                Text("Category List")
                    .font(.system(size: 16))
                    .padding(.leading, 20)
                    .foregroundColor(Color.init(red: 0.4, green: 0.4, blue: 0.4))
                Spacer()
            }
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 255/255, green: 122/255, blue: 109/255), Color(red: 229/255, green: 193/255, blue: 113/255)]), startPoint: .leading, endPoint: .trailing))
                    .offset(x: 20, y: 0)
                
                ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 0) {
                        NavigationLink (destination: PageCategories(title: "Designing")) {
                            VStack {
                                Image("homeCategoryCoding")
                                    .foregroundColor(.white)
                                Text("Design")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                            }
                        }
                        
                        NavigationLink(destination: PageCategories(title: "Coding")) {
                            VStack {
                                Image("homeCategoryDesign")
                                    .foregroundColor(.white)
                                Text("Coding")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                            }
                        }
                        
                        NavigationLink(destination: PageCategories(title: "Officing")) {
                            VStack {
                                Image("homeCategoryOffice")
                                    .foregroundColor(.white)
                                Text("Office")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                            }
                        }
                        
                        NavigationLink(destination: PageCategories(title: "Others")
                                        .navigationBarHidden(true)
                                        .navigationBarTitle("")) {
                            VStack {
                                Image("homeCategoryOther")
                                    .foregroundColor(.white)
                                Text("Others")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                            }
                            .padding(.trailing, 10)
                        }
                        
                    }
                    .padding(Edge.Set.init(arrayLiteral: .top, .bottom), 20)
                }
                .offset(x: 30, y: 0)
                .cornerRadius(5)
            }
        }
        .padding(.top, 10)
    }
}

struct IndexCategoryPartlist_Previews: PreviewProvider {
    static var previews: some View {
        IndexCategoryPartlist()
    }
}
