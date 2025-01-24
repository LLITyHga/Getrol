//
//  HomeViewModelProtocol.swift
//  Getrol
//
//  Created by Andrii Pikus on 08.01.2025.
//


import SwiftUI
import MapKit

protocol HomeViewModelProtocol: ObservableObject {
    var searchText: String { get set }
    var cameraPosition: MapCameraPosition { get set }
    var isMenuOpen: Bool { get set }
    var isPopupOpen: Bool { get }
    var currentState: SheetState { get }
    var selectedFuel: Int { get }
    var gasStations2: [GasStation2] { get }
    
    func onSearchQueryChanged()
    func onRouteAction()
    func onLocationAction()
    func toggleMenu()
}

class HomeViewModel: ObservableObject, HomeViewModelProtocol {
    
    @Published var searchText: String = ""
    @Published var cameraPosition: MapCameraPosition
    @Published var isMenuOpen: Bool = false
    @Published var isPopupOpen: Bool = false
    @Published var currentState: SheetState = .medium
    @Published var selectedFuel: Int = 0
    private let model: HomeModelProtocol
    private let navigation: HomeNavigation
    let gasStations2: [GasStation2] = [
        GasStation2(name: "ОЛАС", address: "Rivne, Makarova Street, 44", coordinates: CLLocationCoordinate2D(latitude: 50.6388489, longitude: 26.196731556540694)),
        GasStation2(name: "ОЛАС", address: "Rozhyshche, Chaikovskoho Street, 22", coordinates: CLLocationCoordinate2D(latitude: 50.90744425886684, longitude: 25.28374788531925)),
        GasStation2(name: "ОЛАС", address: "Kostopil, Burova Street, 19a", coordinates: CLLocationCoordinate2D(latitude: 50.8796141952864, longitude: 26.44925371413518)),
        GasStation2(name: "ОЛАС", address: "Varash, Komunalna Street, 15", coordinates: CLLocationCoordinate2D(latitude: 51.33253795, longitude: 25.8535913)),
        GasStation2(name: "ОЛАС", address: "Rivne, Mlynivska Street, 18", coordinates: CLLocationCoordinate2D(latitude: 50.6457178, longitude: 26.2107882)),
        GasStation2(name: "ОЛАС", address: "Rivne, Soborna Street, 370", coordinates: CLLocationCoordinate2D(latitude: 50.6316252, longitude: 26.2200215)),
        GasStation2(name: "ОЛАС", address: "Zarichne, Aeroflotska Street, 5a", coordinates: CLLocationCoordinate2D(latitude: 51.82230289835494, longitude: 26.120606988655698)),
        GasStation2(name: "ОЛАС", address: "Rivne, Lʹonokombinativska Street", coordinates: CLLocationCoordinate2D(latitude: 50.6387710954842, longitude: 26.2801523228997)),
        GasStation2(name: "ОЛАС", address: "Dubno, Zamkova Street, 32", coordinates: CLLocationCoordinate2D(latitude: 50.420432499103995, longitude: 25.746478025289335)),
        GasStation2(name: "ОЛАС", address: "Rivne, Kyivska Street, 108a", coordinates: CLLocationCoordinate2D(latitude: 50.6118041, longitude: 26.3176735)),
        GasStation2(name: "ОЛАС", address: "Rokytne, I.Franka Street, 12a", coordinates: CLLocationCoordinate2D(latitude: 50.9464392, longitude: 26.4364386)),
        GasStation2(name: "ОЛАС", address: "Volodymyrets, Soborna Street, 2a", coordinates: CLLocationCoordinate2D(latitude: 51.4267573, longitude: 26.1375352)),
        GasStation2(name: "ОЛАС", address: "Rivne, Knyaz Volodymyr Street, 109", coordinates: CLLocationCoordinate2D(latitude: 50.6022717, longitude: 26.28296)),
        GasStation2(name: "ОЛАС", address: "Ivanichi, Zaliznychna Street, 6", coordinates: CLLocationCoordinate2D(latitude: 50.6889868, longitude: 24.4941465)),
        GasStation2(name: "ОЛАС", address: "Sarny, Kovel Street, 20", coordinates: CLLocationCoordinate2D(latitude: 51.3270329, longitude: 26.5917761)),
        GasStation2(name: "ОЛАС", address: "Slavuta, Myru Street, 89a", coordinates: CLLocationCoordinate2D(latitude: 50.3030439, longitude: 26.8187421)),
        GasStation2(name: "ОЛАС", address: "Brody, Pryvokzalna Street, 1", coordinates: CLLocationCoordinate2D(latitude: 50.0746781, longitude: 25.1381037)),
        GasStation2(name: "ОЛАС", address: "Netishyn, Promyslova Street, 1/6a", coordinates: CLLocationCoordinate2D(latitude: 50.3325663, longitude: 26.6707975))
    ]
    
    init(model: HomeModelProtocol, navigation: HomeNavigation) {
        self.model = model
        self.navigation = navigation
        self.cameraPosition = .region(model.cameraRegion)
        self.currentState = model.currentState
    }
    
    func changePosition(value: DragGesture.Value) {
        let dragDirection: SheetStateChangeDirection = value.translation.height > 0 ? .down : .up
        model.changeSheetState(dragDirection: dragDirection)
        self.currentState = model.currentState
    }
    
    func onSearchQueryChanged() {
        model.updateSearchQuery(searchText)
    }
    
    func onRouteAction() {
        model.performRouteAction()
    }
    
    func onLocationAction() {
        var newRegion = cameraPosition.region
               let zoomDelta = 0.1
        newRegion!.span.latitudeDelta += zoomDelta    // zoom for tests
        newRegion!.span.longitudeDelta += zoomDelta
        cameraPosition = .region(newRegion!)
        model.performLocationAction()
    }
    
    func toggleMenu() {
        isMenuOpen.toggle()
    }
    
    func toFuelTypePopup() {
        isPopupOpen = true
        navigation.presentPopUp(.fuelType(onDismiss: {
            self.isPopupOpen = false
        }))
        toggleMenu()
    }

    func toFuelBrandPopup() {
        isPopupOpen = true
        navigation.presentPopUp(.fuelBrand(onDismiss: {
            self.isPopupOpen = false
        }))
        toggleMenu()
    }

    func toSettingsPopup() {
        isPopupOpen = true
        navigation.presentPopUp(.settings(onDismiss: {
            self.isPopupOpen = false
        }))
        toggleMenu()
    }
    
}

struct GasStation2 {
    let name: String
    let address: String
    let coordinates: CLLocationCoordinate2D
}
