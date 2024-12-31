//
//  WelcomeModel.swift
//  Getrol
//
//  Created by Andrii Pikus on 31.12.2024.
//


import Foundation
import CoreLocation

protocol WelcomeModelProtocol {
    var isPermissionGranted: Bool { get }
    var isPermissionChecked: Bool { get }
    func requestLocationPermission()
}

class WelcomeModel: NSObject, ObservableObject, WelcomeModelProtocol, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    private let locationPermissionKey = "LocationPermissionGranted"
    
    @Published var locationStatus: CLAuthorizationStatus?
    @Published var isPermissionGranted: Bool = false
    @Published var isPermissionChecked: Bool = false // Вказує, що користувач відповів
    

    override init() {
        super.init()
        locationManager.delegate = self
        locationStatus = locationManager.authorizationStatus
        isPermissionGranted = UserDefaults.standard.bool(forKey: locationPermissionKey)
    }
    
    func requestLocationPermission() {
        if locationStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        } else {
            checkPermissionStatus()
        }
    }
    
    func checkPermissionStatus() {
        locationStatus = locationManager.authorizationStatus
        if locationStatus == .authorizedWhenInUse || locationStatus == .authorizedAlways {
            isPermissionGranted = true
            UserDefaults.standard.set(true, forKey: locationPermissionKey)
        } else {
            isPermissionGranted = false
            UserDefaults.standard.set(false, forKey: locationPermissionKey)
        }
        isPermissionChecked = true // Після перевірки статусу
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        DispatchQueue.main.async {
            self.checkPermissionStatus()
        }
    }
}
