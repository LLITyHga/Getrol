//
//  AlertConfig.swift
//  Getrol
//
//  Created by Andrii Pikus on 27.01.2025.
//



import SwiftUI

struct AlertConfig: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let okButtonTitle: String
    let cancelButtonTitle: String
    let onOk: (() -> Void)?
    let onCancel: (() -> Void)?
}
