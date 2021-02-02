//
//  SwiftUIStyle.swift
//  CompleteProject
//
//  Created by kh on 2021/1/28.
//

import Foundation
import SwiftUI

struct BigTitle: ViewModifier
{
    func body(content: Content) -> some View
    {
        content
            .font(.system(size: 24))
            .foregroundColor(.init(red: 0.3, green: 0.3, blue: 0.3))
    }
}

struct MiddleTitle: ViewModifier
{
    func body(content: Content) -> some View
    {
        content
            .font(.system(size: 20))
            .foregroundColor(.init(red: 0.3, green: 0.3, blue: 0.3))
    }
}

struct RegularTitle: ViewModifier
{
    func body(content: Content) -> some View
    {
        content
            .font(.system(size: 15))
            .foregroundColor(.init(red: 0.3, green: 0.3, blue: 0.3))
    }
}

struct RegularTitleOption: ViewModifier
{
    var isHighlight = false
    
    func body(content: Content) -> some View
    {
        if isHighlight
        {
            return content
                .font(.system(size: 15))
                .foregroundColor(Color.init(red: 255/255, green: 123/255, blue: 109/255))
        }
        else
        {
            return content
                .font(.system(size: 15))
                .foregroundColor(Color.gray)
        }
    }
}

struct CommonButton: ViewModifier
{
    var isEnable = false
    
    func body(content: Content) -> some View
    {
        if(isEnable)
        {
            return content
                .padding()
                .background(RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 255/255, green: 123/255, blue: 109/255)))
                .foregroundColor(.white)
                .font(.system(size: 15))
        }
        else
        {
            return content
                .padding()
                .background(RoundedRectangle(cornerRadius: 5).fill(Color.gray))
                .foregroundColor(.white)
                .font(.system(size: 15))
        }
    }
}


struct SubTitle: ViewModifier
{
    func body(content: Content) -> some View
    {
        content
            .font(.system(size: 14))
            .foregroundColor(.init(red: 0.6, green: 0.6, blue: 0.6))
    }
}

struct SmallText: ViewModifier
{
    func body(content: Content) -> some View
    {
        content
            .font(.system(size: 12))
            .foregroundColor(.init(red: 0.6, green: 0.6, blue: 0.6))
    }
}

struct RedNumber: ViewModifier
{
    func body(content: Content) -> some View
    {
        content
            .font(.system(size: 20))
            .foregroundColor(.init(red: 255/255, green: 123/255, blue: 109/255))
    }
}


struct RedNumberSmall: ViewModifier
{
    func body(content: Content) -> some View
    {
        content
            .font(.system(size: 16))
            .foregroundColor(.init(red: 255/255, green: 123/255, blue: 109/255))
    }
}

struct LittleStar: ViewModifier
{
    func body(content: Content) -> some View
    {
        content
            .font(.system(size: 10))
            .foregroundColor(.init(red: 255/255, green: 123/255, blue: 109/255))
    }
}

struct StaticText: ViewModifier
{
    func body(content: Content) -> some View
    {
        content
            .font(.system(size: 28))
            .foregroundColor(.white)
            .offset(x: 17, y: -8)
    }
}

struct CategoryLabel: ViewModifier
{
    private let colors = [Color.orange, Color.purple, Color.red, Color.green, Color.blue, Color.pink]
    
    func body(content: Content) -> some View
    {
        content
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 14).fill(colors[Int.random(in: 0 ... 5)]))
            .font(.system(size: 13))
            .foregroundColor(.white)
    }
}

struct LoadingText: ViewModifier
{
    @State private var brightness : Double = 0.0
    
    func body(content: Content) -> some View
    {
        content
            .padding(.leading, 20)
            .modifier(SmallText())
            .brightness(brightness)
            .animation(Animation.spring().repeatForever())
            .onAppear
            {
                self.brightness = 1.0
            }
    }
}

struct VipDateCurrencyEnable: ViewModifier
{
    func body(content: Content) -> some View
    {
        content
            .font(.system(size: 18))
            .foregroundColor(.init(red: 255/255, green: 123/255, blue: 109/255))
            .padding(.top, 0)
            .padding(.bottom, 5)
    }
}
struct VipDateCurrencyDisable: ViewModifier
{
    func body(content: Content) -> some View
    {
        content
            .font(.system(size: 18))
            .foregroundColor(Color.black.opacity(0.2))
            .padding(.top, 0)
            .padding(.bottom, 5)
    }
}
struct VipDatePriceEnable: ViewModifier
{
    func body(content: Content) -> some View
    {
        content
            .font(.system(size: 42))
            .foregroundColor(.init(red: 255/255, green: 123/255, blue: 109/255))
            .padding(.top, 0)
            .padding(.bottom, 5)
    }
}
struct VipDatePriceDisable: ViewModifier
{
    func body(content: Content) -> some View
    {
        content
            .font(.system(size: 42))
            .foregroundColor(Color.black.opacity(0.2))
            .padding(.top, 0)
            .padding(.bottom, 5)
    }
}
struct VipDateTitleEnable: ViewModifier
{
    func body(content: Content) -> some View
    {
        content
            .font(.system(size: 16))
            .foregroundColor(.init(red: 255/255, green: 123/255, blue: 109/255))
            .padding(.top, 15)
    }
}

struct VipDateTitleDisable: ViewModifier
{
    func body(content: Content) -> some View
    {
        content
            .font(.system(size: 16))
            .foregroundColor(Color.black.opacity(0.2))
            .padding(.top, 15)
    }
}

struct VipDateRangeEnable: ViewModifier
{
    func body(content: Content) -> some View
    {
        content
            .padding(.top, 3)
            .padding(.bottom, 3)
            .padding(.leading, nil)
            .padding(.trailing, nil)
            .background(Color.init(red: 255/255, green: 123/255, blue: 109/255))
            .font(.system(size: 14))
            .foregroundColor(.white)
            .padding(.bottom, 5)
    }
}

struct VipDateRangeDisable: ViewModifier
{
    func body(content: Content) -> some View
    {
        content
            .padding(.top, 3)
            .padding(.bottom, 3)
            .padding(.leading, nil)
            .padding(.trailing, nil)
            .background(Color.black.opacity(0.2))
            .font(.system(size: 14))
            .foregroundColor(.white)
            .padding(.bottom, 5)
    }
}

struct VipDateBorderEnable: ViewModifier
{
    func body(content: Content) -> some View
    {
        content
            .border(Color.init(red: 255/255, green: 123/255, blue: 109/255), width: 1)
    }
}

struct VipDateBorderDisable: ViewModifier
{
    func body(content: Content) -> some View
    {
        content
            .border(Color.black.opacity(0.2), width: 1)
    }
}

struct SubscriptionListModifier: ViewModifier
{
    var is4_7InchScreen = false
    
    func body(content: Content) -> some View
    {
        if(is4_7InchScreen)
        {
            return content
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
        }
        else
        {
            return content
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
        }
    }
    
}

struct SubPageContainer: ViewModifier
{
    func body(content: Content) -> some View
    {
        content
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.top, 10)
            .navigationBarTitle("")
            .navigationBarHidden(true)
    }
}

