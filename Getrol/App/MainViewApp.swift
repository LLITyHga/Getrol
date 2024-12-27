//
//  GetrolApp.swift
//  Getrol
//
//  Created by Andrii Pikus on 25.12.2024.
//

import SwiftUI

@main
struct MainViewApp: App {

    @StateObject private var appCoordinator: AppCoordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            appCoordinator.rootView
        }
    }
}
