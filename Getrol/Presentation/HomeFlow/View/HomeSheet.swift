//
//  Untitled.swift
//  Getrol
//
//  Created by Andrii Pikus on 06.01.2025.
//

import SwiftUI

struct HomeSheet: View {
    
    @StateObject  var viewModel: HomeViewModel
    
    let gasStations = [
        GasStation(id: 1, name: "WOG", price: 54.17, distance: 2.5, image: Image(.wogImg), smallImage: Image(.wogSmallImg), address: "вул. Незалежності, 12"),
        GasStation(id: 2, name: "SOCAR", price: 59.99, distance: 3.2, image: Image(.socarImg), smallImage: Image(.socarSmallImg), address: "пр. Перемоги, 45"),
        GasStation(id: 3, name: "OKKO", price: 64.10, distance: 1.8, image: Image(.okkoImg), smallImage: Image(.okkoSmallImg), address: "вул. Лесі Українки, 7"),
        GasStation(id: 4, name: "Ukrnafta", price: 53.50, distance: 4.0, image: Image(.ukrnaftaImg), smallImage: Image(.ukrnaftaSmallImg), address: "вул. Шевченка, 30"),
        GasStation(id: 5, name: "Shell", price: 60.00, distance: 2.1, image: Image(.shellImg), smallImage: Image(.shellSmallImg), address: "бул. Тараса, 9"),
        GasStation(id: 6, name: "AMIC", price: 58.30, distance: 3.5, image: Image(.amicImg), smallImage: Image(.amicSmallImg), address: "вул. Франка, 21"),
        GasStation(id: 7, name: "UPG", price: 55.40, distance: 1.2, image: Image(.upgImg), smallImage: Image(.upgSmallImg), address: "вул. Грушевського, 14"),
        GasStation(id: 8, name: "KLO", price: 59.00, distance: 2.7, image: Image(.kloImg), smallImage: Image(.kloSmallImg), address: "вул. Мазепи, 5"),
        GasStation(id: 9, name: "MOTTO", price: 57.50, distance: 3.8, image: Image(.mottoImg), smallImage: Image(.mottoSmallImg), address: "вул. Довженка, 8"),
        GasStation(id: 10, name: "AMIC", price: 59.30, distance: 2.4, image: Image(.amicImg), smallImage: Image(.amicSmallImg), address: "пр. Галицький, 12"),
        GasStation(id: 11, name: "UPG", price: 56.80, distance: 1.8, image: Image(.upgImg), smallImage: Image(.upgSmallImg), address: "вул. Січових Стрільців, 33"),
        GasStation(id: 12, name: "KLO", price: 60.50, distance: 2.0, image: Image(.kloImg), smallImage: Image(.kloSmallImg), address: "вул. Набережна, 2"),
        GasStation(id: 13, name: "MOTTO", price: 58.00, distance: 4.2, image: Image(.mottoImg), smallImage: Image(.mottoSmallImg), address: "вул. Лесі Українки, 27")
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            dragHandle()
                .gesture(
                    DragGesture()
                        .onEnded { value in
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                viewModel.changePosition(value: value)
                            }
                        }
                )
            
            if viewModel.currentState == .minimized {
                minimizedView
            } else if viewModel.currentState == .medium {
                mediumView
            } else if viewModel.currentState == .expanded {
                SwitcherView(selectedFuel: $viewModel.selectedFuel)
                expandedView
            }
        }

        .frame(maxWidth: .infinity)
        .background(.bg)
        .cornerRadius(16)
        .shadow(radius: 8)
        .animation(.easeInOut, value: viewModel.currentState)
    }
    
    
    private var minimizedView: some View {
        VStack {
            Color.clear.frame(height: 10)
        }
        .padding(.bottom, 10)
    }
    
    private var mediumView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 24) {
                ForEach(gasStations, id: \.id) { station in
                    
                    VStack(spacing: 0) {
                        ZStack(alignment: .topLeading) {
                            station.image
                                .frame(width: 151, height: 76)
                                .padding(.top, 14)
                            
                            PriceTagView(price: station.price, color: .green)
                                .offset(x: -2, y: 0)
                                .frame(width: 75, height: 24)
                        }
                        
                        Text(station.name)
                            .font(.body)
                            .foregroundColor(.text)
                            .padding(.top, 8)
                        
                        HStack {
                            Image(.roadIco)
                            Text("5 хв.")
                                .font(.small)
                                .foregroundColor(.text)
                            
                            Spacer()
                            
                            Image(.routeIco)
                            Text("\(String(format: "%.1f", station.distance)) км")
                                .font(.small)
                                .foregroundColor(.text)
                        }
                        .padding(.horizontal, 8)
                        .padding(.top, 4)
                    }
                    .frame(width: 151, height: 146)
                    .background(.bg)
                    .padding(.top, 50)
                    .padding(.bottom, 24)
                    
                }
            }
            .padding(.leading, 130)
        }
        .background(.bg)
    }
    
    private var expandedView: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(gasStations, id: \.id) { station in
                    HStack(spacing: 0) {
                        Text("\(String(format: "%.2f", station.price))")
                            .font(.h2)
                            .foregroundStyle(.black)
                            .padding(.horizontal, 8)
                        
                        station.smallImage
                            .frame(width: 42, height: 45)
                        Spacer()
                        VStack(spacing: 4) {
                            Text(station.name)
                                .font(.h2)
                                .foregroundStyle(.text)
                            Text(station.address)
                                .font(Font.small)
                                .foregroundStyle(Color.darkElement)
                        }
                        .padding(.vertical, 8)
                        Spacer()
                        Text("\(String(format: "%.1f", station.distance)) km")
                            .font(Font.small)
                            .foregroundColor(.bg)
                            .frame(width: 50, height: 33, alignment: .center)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.darkElement)
                            )
                        
                        Image(systemName: "chevron.right")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 10, height: 17)
                            .foregroundColor(.text)
                            .padding(.leading, 23)
                    }
                    Divider()
                        .frame(height: 1)
                        .background(Color(hex: "82A09F").opacity(0.4))
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)
                }
            }
            .padding(16)
        }
    }
}

struct SwitcherView: View {
    @Binding var selectedFuel: Int
    
    let options = [LS.Home.price, LS.Home.distance]
    let colors: [Color] = [.line, .blur]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<options.count, id: \.self) { index in
                Text(options[index])
                    .font(.h2)
                    .foregroundColor(selectedFuel == index ? .bg : .text)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 6)
                    .background(selectedFuel == index ? colors[0] : colors[1])
                    .cornerRadius(8)
                    .onTapGesture {
                        withAnimation {
                            selectedFuel = index
                        }
                    }
            }
        }
        .padding(.horizontal, 26)
    }
}

struct PriceTagView: View {
    let price: Double
    let color: Color
    
    var body: some View {
        Text(String(format: "%.2f", price))
            .font(.bodyMedum)
            .foregroundColor(.bg)
            .padding(.horizontal, 16)
            .padding(.vertical, 5)
            .background(color)
            .cornerRadius(13)
    }
}

struct GasStation {
    let id: Int
    let name: String
    let price: Double
    let distance: Double
    let image: Image
    let smallImage: Image
    let address: String
}
