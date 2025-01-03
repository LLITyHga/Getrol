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
    var selectedFuelType: Int { get set }
    func requestLocationPermission()
    func setSelectedFuelType(_ type: Int)
    func checkPermissionStatus()
}

protocol WelcomeModelDelegate: AnyObject {
    func permissionStatusDidChange(isGranted: Bool)
}

class WelcomeModel: NSObject, WelcomeModelProtocol, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    weak var delegate: WelcomeModelDelegate?
    
    @Published var isPermissionGranted: Bool = UserDefaults.Local.isLocationPermissionGranted
    @Published var isPermissionChecked: Bool = UserDefaults.Local.isLocationPermissionChecked
    @Published var selectedFuelType: Int = UserDefaults.Local.selectedFuelType
    
    override init() {
        super.init()
        locationManager.delegate = self
        isPermissionGranted = UserDefaults.Local.isLocationPermissionGranted
        selectedFuelType = UserDefaults.Local.selectedFuelType
    }
    
    func requestLocationPermission() {
        let locationManager = CLLocationManager()

        if locationManager.authorizationStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
              }
        checkPermissionStatus()
    }
    
    func setSelectedFuelType(_ type: Int) {
        selectedFuelType = type
        UserDefaults.Local.selectedFuelType = type
    }
    
    func checkPermissionStatus() {
        let status = locationManager.authorizationStatus
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            isPermissionGranted = true
            UserDefaults.Local.isLocationPermissionGranted = true
        } else {
            isPermissionGranted = false
            UserDefaults.Local.isLocationPermissionGranted = false
        }
        isPermissionChecked = true
        UserDefaults.Local.isLocationPermissionChecked = true
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard !isPermissionChecked else { return }

        if status == .authorizedWhenInUse || status == .authorizedAlways {
            isPermissionChecked = true
            delegate?.permissionStatusDidChange(isGranted: true)
        } else if status == .denied || status == .restricted {
            isPermissionChecked = true
            delegate?.permissionStatusDidChange(isGranted: false)
        }
    }
}
