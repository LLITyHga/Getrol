//
//  PopupModifier.swift
//  Getrol
//
//  Created by Andrii Pikus on 13.01.2025.
//

import SwiftUI

struct PopupModifier<Item: Equatable, V: View>: ViewModifier {
    
    @Binding var item: Item?
    @ViewBuilder var view: (Item) -> V
    @State private var popupHeight: CGFloat = 0
    @State private var offset: CGFloat = UIScreen.main.bounds.height
    var bottomPadding: CGFloat = 20

    func body(content: Content) -> some View {
        ZStack {
            content
                .zIndex(0)
            
            if let item = item {
                GeometryReader { geometry in
                    view(item)
                        .environment(\.dismissModal, {
                            withAnimation(.spring(response: 0.9, dampingFraction: 0.8)) {
                                self.offset = geometry.size.height
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                self.item = nil
                                self.offset = geometry.size.height
                            }
                        })
                        .padding(.horizontal, geometry.size.width > 380 ? 25 : 18)
                        .background(
                            GeometryReader { proxy in
                                Color.clear
                                    .onAppear {
                                        popupHeight = proxy.size.height
                                    }
                            }
                        )
                        .offset(y: offset)
                        .onAppear {
                            withAnimation(.spring(response: 0.9, dampingFraction: 0.8)) {
                                let screenHeight = geometry.size.height
                                let calculatedOffset = screenHeight - popupHeight - bottomPadding
                                
                                offset = calculatedOffset
                            }
                        }
                        .transition(.move(edge: .bottom))
                        .edgesIgnoringSafeArea(.all)
                        .zIndex(1)
                }
            }
        }
        .animation(.easeInOut, value: item)
    }
}

private struct ModalDismissKey: EnvironmentKey {
    static var defaultValue: () -> Void = {}
}

extension EnvironmentValues {
    var dismissModal: () -> Void {
        get { self[ModalDismissKey.self] }
        set { self[ModalDismissKey.self] = newValue }
    }
}

extension View {
    func popup<Item, Content>(item: Binding<Item?>, bottomPadding: CGFloat = 20, @ViewBuilder content: @escaping (Item) -> Content) -> some View where Item: Equatable, Content: View {
        modifier(PopupModifier(item: item, view: content, bottomPadding: bottomPadding))
    }
}
