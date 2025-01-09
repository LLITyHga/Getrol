//
//  HomeModelProtocol.swift
//  Getrol
//
//  Created by Andrii Pikus on 08.01.2025.
//


import Foundation
import MapKit

protocol HomeModelProtocol {
    var cameraRegion: MKCoordinateRegion { get }
    func updateSearchQuery(_ query: String)
    func performRouteAction()
    func performLocationAction()
    func handleMenuAction(_ type: MenuButtonType)
}

enum MenuButtonType {
    case menu1, menu2, menu3, settings
}

class HomeModel: HomeModelProtocol {
    private(set) var cameraRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 50.4501, longitude: 30.5234),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    func updateSearchQuery(_ query: String) {
        print("Search query updated: \(query)")
    }
    
    func performRouteAction() {
        print("Performing route action...")
    }
    
    func performLocationAction() {
        print("Performing location action...")
    }
    
    func handleMenuAction(_ type: MenuButtonType) {
        switch type {
        case .menu1:
            print("Menu 1 action triggered")
        case .menu2:
            print("Menu 2 action triggered")
        case .menu3:
            print("Menu 3 action triggered")
        case .settings:
            print("Settings action triggered")
        }
    }
}