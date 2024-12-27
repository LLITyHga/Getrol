//
//  Input.swift
//  Getrol
//
//  Created by Andrii Pikus on 25.12.2024.
//


import SwiftUI

extension Font {
    private static let fontDesign: Font.Design = .default
    
    static var h1: Font = .custom("Gilroy-Medium", size: 24)
        .weight(.regular)
    
    static var h2: Font = .custom("Gilroy-Regular", size: 18)
        .weight(.regular)
    
    static var body: Font = .custom("Gilroy-Regular", size: 16)
        .weight(.regular)
    
    static var small: Font = .custom("Gilroy-Regular", size: 11)
        .weight(.regular)
}
