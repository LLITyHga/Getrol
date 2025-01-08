//
//  HomeView.swift
//  Getrol
//
//  Created by Andrii Pikus on 03.01.2025.
//

import SwiftUI
import MapKit

struct HomeView: View {
    
    @State private var searchText = ""
    @State private var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 50.4501, longitude: 30.5234),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    )

    var body: some View {
           ZStack {
               Map(position: $cameraPosition) {
                   // Карта без додаткових маркерів
               }
               .mapStyle(.standard())
               .ignoresSafeArea(edges: .all)
                   VStack(spacing: 0) {
                       searchFeld()
                       RouteButtons()
                       Spacer()
                       MenuButtons()
                       HomeSheet()
                           .padding(.top, 16)
                   }
                   .ignoresSafeArea()
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
        TextField(LS.Home.search, text: $searchText)
            .padding(.horizontal, 16)
            .frame(height: 56)
            .background(.bg)
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
    }
    @ViewBuilder
    func MenuButtons() -> some View {
        HStack(spacing: 16) {
            // Перша кнопка
            Button(action: {
                // Дія для першої кнопки
            }) {
                Image(.menulosedImg)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 42, height: 42)
            }
            .padding(.trailing, 24)
                        
            // Друга кнопка
            Button(action: {
                // Дія для другої кнопки
            }) {
                Image(.tupeFuelImg)
                    .resizable()
                    .scaledToFit()
             //       .frame(width: 144, height: 42)
            }
                        
            // Третя кнопка
            Button(action: {
                // Дія для третьої кнопки
            }) {
                Image(.markImg) // Замініть на потрібну іконку
                    .resizable()
                    .scaledToFit()
                 //   .frame(width: 144, height: 42)
            }
                Button(action: {
                    
            }) {
                Image(.settigsImg)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 42, height: 42)
            }
        }
        .padding(.horizontal, 16)
  //      .padding(.bottom, 16) // Відступ над шітом
        .background(Color.clear) // Прозорий фон}
    }
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
