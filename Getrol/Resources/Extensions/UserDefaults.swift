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
            case isLocationPermissionGranted
            case isLocationPermissionChecked
            case selectedFuelType
        }
        
        private static var userDefaults: UserDefaults {
            return UserDefaults.standard
        }
        
        static var selectedFuelType: Int {
                 get { return userDefaults.value(forKey: Keys.selectedFuelType.rawValue) as? Int ?? 0 }
                 set { userDefaults.setValue(newValue, forKey: Keys.selectedFuelType.rawValue) }
             }
        
        static var isFirstLaunch: Bool {
            get { return userDefaults.value(forKey: Keys.isFirstLaunch.rawValue) as? Bool ?? true }
            set { userDefaults.setValue(newValue, forKey: Keys.isFirstLaunch.rawValue) }
        }
        
        static var isUserAuth: Bool {
            get { return userDefaults.value(forKey: Keys.isUserAuth.rawValue) as? Bool ?? true }
            set { userDefaults.setValue(newValue, forKey: Keys.isUserAuth.rawValue) }
        }
        
        static var isLocationPermissionGranted: Bool {
            get { return userDefaults.value(forKey: Keys.isLocationPermissionGranted.rawValue) as? Bool ?? false }
            set { userDefaults.setValue(newValue, forKey: Keys.isLocationPermissionGranted.rawValue) }
        }
        
        static var isLocationPermissionChecked: Bool {
            get { return userDefaults.value(forKey: Keys.isLocationPermissionChecked.rawValue) as? Bool ?? false }
            set { userDefaults.setValue(newValue, forKey: Keys.isLocationPermissionChecked.rawValue) }
        }
    }
}
