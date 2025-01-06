//
//  HomeView.swift
//  Getrol
//
//  Created by Andrii Pikus on 03.01.2025.
//

import SwiftUI
import MapKit

struct HomeView: View {
    
    @State private var isSheetPresented = true
    @State private var sheetDetent: PresentationDetent = .fraction(0.2)
    @State private var searchText = ""
    @State private var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 50.4501, longitude: 30.5234), // Центр Києва
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    )

    var body: some View {
        ZStack {
            Map(position: $cameraPosition) {
                       // Карта без додаткових маркерів
                   }
                   .mapStyle(.standard()) // Стандартний стиль карти
                   .ignoresSafeArea(edges: .all)
            VStack(spacing: 0) {
                searchFeld()
                
                RouteButtons()
                Spacer()
            }
            .padding(.top, 24)
        }
    }
}

#Preview {
    HomeView()
}

extension HomeView {
    @ViewBuilder
    func searchFeld () -> some View {
        TextField("Search", text: $searchText)
            .padding(.horizontal, 16)
            .frame(height: 56)
            .background(Color.bg)
            .cornerRadius(8)
            .padding(.horizontal, 16)
    }
    
    @ViewBuilder
    func RouteButtons() -> some View {
        HStack(spacing: 0) {
            Spacer()
            VStack(spacing: 0) {
                Button(action: {
                    // do smtng
                }) {
                    Image(.routeImg)
                        .frame(width: 42, height: 42)
                    
                }
                .padding(.vertical, 16)
                .padding(.trailing, 16)
                
                Button(action: {
                    // do smtng
                }) {
                    Image(.locationImg)
                        .frame(width: 42, height: 42)
                }
                .padding(.trailing, 16)
            }
        }
        .sheet(isPresented: $isSheetPresented) {
            HomeSheet(currentDetent: $sheetDetent)
                .presentationDetents([.fraction(0.27), .large], selection: $sheetDetent)
                .interactiveDismissDisabled(true) // Забороняє закриття свайпом
                .onChange(of: sheetDetent) { old, newDetent in
                    if newDetent == .fraction(0.2) {
                        sheetDetent = .fraction(0.2)
                    }
                }
        }
    }
 //   @ViewBuilder
     
}



//    import SwiftUI
//
//    struct ContentView: View {
//        @State private var isSheetPresented = true
//        @State private var sheetDetent: PresentationDetent = .fraction(0.2)
//        
//        var body: some View {
//            Button("Відкрити Sheet") {
//                isSheetPresented = true
//            }
//            .sheet(isPresented: $isSheetPresented) {
//                SheetView()
//                    .presentationDetents([.fraction(0.2), .large], selection: $sheetDetent)
//                    .interactiveDismissDisabled(true) // Забороняє закриття свайпом
//                    .onChange(of: sheetDetent) { old, newDetent in
//                        if newDetent == .fraction(0.2) {
//                            // Повертаємо положення на .fraction(0.2), якщо намагаються свайпнути вниз
//                            sheetDetent = .fraction(0.2)
//                        }
//                    }
//            }
//        }
//    }
//
//    struct SheetView: View {
//        var body: some View {
//            VStack {
//                Text("Sheet View")
//                    .font(.title)
//                    .padding()
//                Spacer()
//            }
//        }
//    }
