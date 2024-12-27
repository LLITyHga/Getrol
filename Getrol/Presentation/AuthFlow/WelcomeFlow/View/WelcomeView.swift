//
//  WelcomeView.swift
//  Getrol
//
//  Created by Andrii Pikus on 26.12.2024.
//

import SwiftUI

struct WelcomeView: View {
    @ObservedObject var viewModel: WelcomeFlowViewModelImpl
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                Text("Getrol")
                    .font(.custom("Gilroy-ExtraBold", size: 64))
                    .fontWeight(.regular)
                    .foregroundStyle(.text)
                    .padding(.bottom, 56)
                
                Text("Вітаємо у Getrol!")
                    .font(.body)
                    .foregroundStyle(.black)
                    .padding(.bottom, 8)
                
                Text("Шукай найкращі ціни на пальне разом із нашим додатком.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.black)
            }
            
            Spacer()
            
            Button(action: {
                viewModel.proceedFromWelcome()
            }) {
                Text("Поїхали")
                    .frame(maxWidth: .infinity, minHeight: 48)
                    .foregroundStyle(.text)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(Color.black, lineWidth: 1)
                    )
                    .contentShape(Rectangle())
            }
            .padding(.bottom, 48)
            .padding(.horizontal, 25)
        }
        .background(.bg)
    }
}

struct LocationPermissionView: View {
    @ObservedObject var viewModel: WelcomeFlowViewModelImpl
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                LocationIconView()
                    .padding(.horizontal, 75)
                    .padding(.bottom, 56)
                
                Text("Локація")
                    .font(.h1)
                    .foregroundStyle(.black)
                    .padding(.bottom, 8)
                
                Text("Getrol потребує доступу до вашого місцезнаходження для коректної роботи та надання основних послуг.")
                    .font(.body)
                    .padding(.horizontal, 16)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.black)
            }
            
            Spacer()
            
            Button(action: {
                viewModel.proceedFromLocationPermission()
            }) {
                Text("Далі")
                    .foregroundStyle(.text)
            }
            .padding(.bottom, 48)
            .padding(.horizontal, 25)
        }
        .frame(maxWidth: .infinity)
        .background(.bg)
        .navigationBarBackButtonHidden(true)
    }
}

struct FuelTypeSelectionView: View {
    @ObservedObject var viewModel: WelcomeFlowViewModelImpl
    
    var body: some View {
        VStack {
            Text("Select Your Fuel Type")
                .font(.title)
            Button("Gasoline") {
                viewModel.proceedFromFuelTypeSelection()
            }
            
        }
        .background(.bg)
        .navigationBarBackButtonHidden(true)
    }
}

struct LocationIconView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(.accent2, lineWidth: 2)
                .frame(width: 224, height: 224)
                .overlay(
                    Circle()
                        .fill(.accent2)
                        .frame(width: 10, height: 10)
                        .offset(x: 79, y: -79)
                )

            Circle()
                .fill(.accent2)
                .frame(width: 152, height: 152)
                .opacity(0.05)

            Image(systemName: "location")
                .font(.system(size: 50, weight: .regular))
                .foregroundColor(.black)
        }
    }
}

#Preview {
    WelcomeFlowCoordinator()
}
