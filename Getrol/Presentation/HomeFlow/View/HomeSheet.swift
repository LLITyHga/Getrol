//
//  Untitled.swift
//  Getrol
//
//  Created by Andrii Pikus on 06.01.2025.
//

import SwiftUI

struct HomeSheet: View {

    @Binding var currentDetent: PresentationDetent
    let gasStations = [
        GasStation(
            id: 1, name: "WOG", price: 54.17, distance: 2.5,
            image: Image(.wogImg)),
        GasStation(
            id: 2, name: "SOCAR", price: 59.99, distance: 3.2,
            image: Image(.socarImg)),
        GasStation(
            id: 3, name: "OKKO", price: 64.10, distance: 1.8,
            image: Image(.okkoImg)),
        GasStation(
            id: 4, name: "Ukrnafta", price: 53.50, distance: 4.0,
            image: Image(.ukrnaftaImg)),
        GasStation(
            id: 5, name: "Shell", price: 60.00, distance: 2.1,
            image: Image(.shellImg)),
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(gasStations, id: \.id) { station in
                    ZStack(alignment: .topLeading) {
                        // Основний контейнер
                        VStack(spacing: 0) {
                            // Зображення логотипа
                            station.image
                                .frame(width: 151, height: 76)
                                .padding(.top, 12)

                            // Назва заправки
                            Text(station.name)
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding(.top, 8)

                            // Ціна та відстань
                            HStack {
                                Image(.roadIco)
                                Text(
                                    "\(String(format: "%.2f", station.price)) грн"
                                )
                                .font(.subheadline)
                                .foregroundColor(.gray)

                                Spacer()

                                Image(.routeIco)
                                Text(
                                    "\(String(format: "%.1f", station.distance)) км"
                                )
                                .font(.footnote)
                                .foregroundColor(.gray)
                            }
                            .padding(.top, 4)
                        }
                        .frame(width: 151, height: 146)
                        .background(Color.yellow)
                        .cornerRadius(12)
                        .shadow(radius: 4)

                        // PriceTagView у верхньому лівому кутку
                        PriceTagView(price: station.price, color: .green)
                            .frame(width: 70, height: 30)  // Налаштуйте розмір тега за необхідності
                            .offset(x: 0, y: 0)  // Без відступів
                    }
                    .padding(.top, 50)
                }
            }
        }
        .padding(.leading, 130)
    }
}

//#Preview {
//    HomeSheet(currentDetent: .large)
//}

struct PriceTagView: View {
    let price: Double
    let color: Color

    var body: some View {
        Text(String(format: "%.2f", price))
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(.white)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(color)
            .cornerRadius(12)
    }
}

struct GasStation {
    let id: Int
    let name: String
    let price: Double
    let distance: Double
    let image: Image
}
