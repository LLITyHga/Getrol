//
//  InitialSetupCoordinator.swift
//  Getrol
//
//  Created by Andrii Pikus on 26.12.2024.
//


import SwiftUI

protocol WelcomeFlowNavigation {
    func pushScreen(_ screen: WelcomelFlow.Screen)
}

struct WelcomeFlowCoordinator: View, WelcomeFlowNavigation {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            WelcomeView(viewModel: makeViewModel())
                .navigationDestination(for: WelcomelFlow.Screen.self) { destination in
                    linkDestination(for: destination)
                }
        }
    }

    // Реалізація протоколу
    func pushScreen(_ screen: WelcomelFlow.Screen) {
        path.append(screen)
    }

    private func makeViewModel() -> WelcomeFlowViewModelImpl {
        WelcomeFlowViewModelImpl(navigation: self)
    }

    @ViewBuilder
    private func linkDestination(for screen: WelcomelFlow.Screen) -> some View {
        switch screen {
        case .welcome:
            WelcomeView(viewModel: makeViewModel())
        case .locationPermission:
            LocationPermissionView(viewModel: makeViewModel())
        case .fuelTypeSelection:
            FuelTypeSelectionView(viewModel: makeViewModel())
        case .main:
            Text("Main Screen")
        }
    }
}
