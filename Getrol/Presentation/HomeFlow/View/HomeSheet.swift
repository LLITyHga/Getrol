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
        GasStation(id: 1, name: "WOG", price: 54.17, distance: 2.5, image: Image(.wogImg)),
        GasStation(id: 2, name: "SOCAR", price: 59.99, distance: 3.2, image: Image(.socarImg)),
        GasStation(id: 3, name: "OKKO", price: 64.10, distance: 1.8, image: Image(.okkoImg)),
        GasStation(id: 4, name: "Ukrnafta", price: 53.50, distance: 4.0, image: Image(.ukrnaftaImg)),
        GasStation(id: 5, name: "Shell", price: 60.00, distance: 2.1, image: Image(.shellImg)),
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            dragHandle
            
            if viewModel.currentState == .minimized {
                minimizedView
            } else if viewModel.currentState == .medium {
                mediumView
            } else if viewModel.currentState == .expanded {
                expandedView
            }
        }
        .frame(maxWidth: .infinity)
        .background(.bg)
        .cornerRadius(16)
        .shadow(radius: 8)
        .animation(.easeInOut, value: viewModel.currentState)
    }
    
    private var dragHandle: some View {
        RoundedRectangle(cornerRadius: 3)
            .fill(.text)
            .frame(width: 36, height: 5)
            .contentShape(Rectangle())
            .padding(.vertical, 12)
            .gesture(
                DragGesture()
                    .onEnded { value in
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                            viewModel.changePosition(value: value)
                        }
                    }
            )
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
                            Text("\(String(format: "%.2f", station.price)) грн")
                                .font(.small)
                                .foregroundColor(.text)
                            
                            Spacer()
                            
                            Image(.routeIco)
                            Text("\(String(format: "%.1f", station.distance)) км")
                                .font(.small)
                                .foregroundColor(.text)
                        }
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
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            station.image
                                .frame(width: 100, height: 50)
                            Spacer()
                            Text("\(String(format: "%.2f", station.price)) грн")
                        }
                        Text(station.name)
                            .font(.headline)
                        Text("\(String(format: "%.1f", station.distance)) км")
                            .font(.subheadline)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                }
            }
            .padding(16)
        }
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
}

#Preview {
    HomeSheet(viewModel: HomeViewModel(model: HomeModel()))
}
