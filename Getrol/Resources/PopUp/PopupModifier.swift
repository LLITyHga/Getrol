//
//  PopupModifier.swift
//  Getrol
//
//  Created by Andrii Pikus on 13.01.2025.
//


import SwiftUI

struct PopupModifier<Item:Equatable, V:View>: ViewModifier {
    @Binding var item: Item?
    @ViewBuilder var view: (Item) -> V
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .zIndex(0)
            
            if let item = item {
                view(item)
                    .environment(\.dismissModal, {
                        self.item = nil
                    })
                    .transition(.opacity)
                    .edgesIgnoringSafeArea(.all)
                    .zIndex(1)
            }
        }
        .animation(.easeInOut, value: item)
    }
}

private struct ModalDismissKey: EnvironmentKey {
    static let defaultValue: () -> Void = {}
}

extension EnvironmentValues {
    var dismissModal: () -> Void {
        get { self[ModalDismissKey.self] }
        set { self[ModalDismissKey.self] = newValue }
    }
}

extension View {
    func popup<Item, Content>(item: Binding<Item?>, @ViewBuilder content: @escaping (Item) -> Content) -> some View where Item: Equatable, Content: View {
        modifier(PopupModifier(item: item, view: content))
    }
}