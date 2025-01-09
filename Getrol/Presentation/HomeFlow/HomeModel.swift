//
//  HomeModelProtocol.swift
//  Getrol
//
//  Created by Andrii Pikus on 08.01.2025.
//

import MapKit
import SwiftUI

protocol HomeModelProtocol {
    var cameraRegion: MKCoordinateRegion { get }
    var currentState: SheetState { get }
    func updateSearchQuery(_ query: String)
    func performRouteAction()
    func performLocationAction()
    func handleMenuAction(_ type: MenuButtonType)
    func changeSheetState(dragDirection: SheetStateChangeDirection)
}

enum MenuButtonType {
    case menu1, menu2, menu3, settings
}

enum SheetStateChangeDirection {
    case up
    case down
}

enum SheetState {
    case minimized
    case medium
    case expanded
}

class HomeModel: HomeModelProtocol {
    
    @Published var currentState: SheetState = .medium
    
    func changeSheetState(dragDirection: SheetStateChangeDirection) {
        switch dragDirection {
        case .up:
            currentState = (currentState == .minimized) ? .medium : .expanded
        case .down:
            currentState = (currentState == .expanded) ? .medium : .minimized
        }
    }
    
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
