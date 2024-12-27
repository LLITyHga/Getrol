//
//  Local.swift
//  Getrol
//
//  Created by Andrii Pikus on 25.12.2024.
//


import Foundation

extension UserDefaults {
    enum Local {
        private enum Keys: String {
            case isFirstLaunch
            case isUserAuth
        }
        
        private static var userDefaults: UserDefaults {
          return UserDefaults.standard
        }
        
        static var isFirstLaunch: Bool {
            get { return userDefaults.value(forKey: Keys.isFirstLaunch.rawValue) as? Bool ?? true }
            set { userDefaults.setValue(newValue, forKey: Keys.isFirstLaunch.rawValue) }
        }
        
        static var isUserAuth: Bool {
            get { return userDefaults.value(forKey: Keys.isUserAuth.rawValue) as? Bool ?? true }
            set { userDefaults.setValue(newValue, forKey: Keys.isUserAuth.rawValue) }
        }
    }
}