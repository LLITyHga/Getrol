//
//  AuthorizationFlow.swift
//  Getrol
//
//  Created by Andrii Pikus on 15.01.2025.
//


import Foundation

enum HomeFlow: Hashable{
    
    enum PopUp: Identifiable {
        
        case fuelBrand
        case fuelType
        case settings
        
        var id: String {
            String(describing: self)
        }
    }
    
    enum Screen: Identifiable {
        
        
        var id: String {
            String(describing: self)
        }
    }
    
    enum Sheet: Identifiable {
     
        
        var id: String {
            String(describing: self)
        }
    }
    
    enum FullScreenCover: Identifiable {
        
        
        var id: String {
            String(describing: self)
        }
    }
}
