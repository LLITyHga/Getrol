//
//  Input.swift
//  Getrol
//
//  Created by Andrii Pikus on 25.12.2024.
//


import SwiftUI

extension Font {
    private static let fontDesign: Font.Design = .default
    
    static var title: Font = .custom("Gilroy-ExtraBold", size: 64)
        .weight(.regular)
    
    static var h1: Font = .custom("Gilroy-Medium", size: 24)
        .weight(.regular)
    
    static var h2: Font = .custom("Gilroy-Regular", size: 18)
        .weight(.regular)
    
    static var body: Font = .custom("Gilroy-Regular", size: 16)
        .weight(.regular)
    
    static var bodyMedum: Font = .custom("Gilroy-Medum", size: 16)
        .weight(.regular)
    
    static var small: Font = .custom("Gilroy-Regular", size: 11)
        .weight(.regular)
    
     static var systemBold: Font = .custom("SF Pro", size: 17)
         .weight(.semibold)
         .leading(.tight)

     static var systemRegular: Font = .custom("SF Pro", size: 16)
         .weight(.regular)
         .leading(.tight)
}
