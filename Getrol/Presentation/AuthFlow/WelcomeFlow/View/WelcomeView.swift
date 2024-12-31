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
                Text(LS.Welcome.title)
                    .font(.custom("Gilroy-ExtraBold", size: 64))
                    .fontWeight(.regular)
                    .foregroundStyle(.text)
                    .padding(.bottom, 56)
                
                Text(LS.Welcome.greeting)
                    .font(.body)
                    .foregroundStyle(.black)
                    .padding(.bottom, 8)
                
                Text(LS.Welcome.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.black)
            }
            
            Spacer()
            
            Button(action: {
                viewModel.proceedFromWelcome()
            }) {
                Text(LS.Welcome.buttonNext)
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

//MARK: Location View

struct LocationPermissionView: View {
    @ObservedObject var viewModel: WelcomeFlowViewModelImpl
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                LocationIconView()
                    .padding(.horizontal, 75)
                    .padding(.bottom, 56)
                
                Text(LS.LocationPermission.title)
                    .font(.h1)
                    .foregroundStyle(.black)
                    .padding(.bottom, 8)
                
                Text(LS.LocationPermission.description)
                    .font(.body)
                    .padding(.horizontal, 16)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.black)
            }
            
            Spacer()
            
            Button(action: {
                viewModel.requestLocationPermission()
                viewModel.handlePermissionStatus()
            }) {
                Text(LS.LocationPermission.buttonNext)
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
//MARK: SelectFuel View

struct FuelTypeSelectionView: View {
    @ObservedObject var viewModel: WelcomeFlowViewModelImpl
    @State private var selectedFuel = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                Image(.petrolImg)
                
                Text(LS.FuelTypeSelection.title)
                    .font(.h1)
                
                FuelSwitcherView()
                
                Text(LS.FuelTypeSelection.note)
                    .font(.custom("Gilroy-Medium", size: 14)
                    .weight(.regular))
                    .foregroundStyle(.text)
            }
            
            Spacer()
            
            Button(action: {
                viewModel.proceedFromLocationPermission()
            }) {
                Text(LS.FuelTypeSelection.buttonNext)
                    .foregroundStyle(.text)
            }
            .padding(.bottom, 48)
            .padding(.horizontal, 25)
        }
        .background(.bg)
        .navigationBarBackButtonHidden(true)
    }
}

//MARK: Switcher for choose fuel

struct FuelSwitcherView: View {
    @State private var selectedFuel = 0

    let options = [LS.FuelTypeSelection.petrolOption, LS.FuelTypeSelection.dieselOption]
    let colors: [Color] = [.line, .blur]

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<options.count, id: \.self) { index in
                Text(options[index])
                    .font(.body)
                    .foregroundColor(selectedFuel == index ? .bg : .text)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(selectedFuel == index ? colors[0] : colors[1])
                    .cornerRadius(8)
                    .onTapGesture {
                        withAnimation {
                            selectedFuel = index
                        }
                    }
            }
        }
        .padding()
    }
}
//MARK: Icon for location View

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
