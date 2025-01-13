//
//  FuelBrandPopup.swift
//  Getrol
//
//  Created by Andrii Pikus on 13.01.2025.
//

import SwiftUI

struct FuelBrandPopup: View {
    @Environment(\.dismissModal) private var dismissModal
    @State private var selectedBrands: [String: Bool] = [
        "Ukrnafta": true,
        "OKKO": true,
        "Shell": true,
        "Wog": true,
        "SOCAR": true,
        "KLO": true,
        "AMIC": true,
        "Motto": true,
        "UPG": true,
        "VST": true
    ]

    var body: some View {
        VStack(spacing: 0) {
            dragHandle()
                .gesture(
                    DragGesture()
                        .onEnded { value in
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                if value.translation.height > 0 {
                                    dismissModal()
                                }
                            }
                        }
                )

            // Заголовок
            Text("Марка пального")
                .font(.h2)
                .foregroundColor(.text)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 20)
                .padding(.bottom, 8)

            Text("Активуйте марки пального, якими користуєтесь.")
                .font(.small)
                .foregroundColor(.text)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 16)
                .padding(.bottom, 27)

            Divider()
                .frame(height: 1)
                .background(Color.gray.opacity(0.3))
                .padding(.horizontal, 8)
            
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(Array(selectedBrands.keys), id: \.self) { brand in
                        if let isActive = selectedBrands[brand] {
                            FuelBrandRow(brandName: brand, isActive: Binding(
                                get: { isActive },
                                set: { selectedBrands[brand] = $0 }
                            ))
                        }
                    }
                }
                .padding(.vertical, 16)
            }
        }
        .frame(width: 342, height: 638, alignment: .center)
        .background(.bg)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 7)
    }
}

struct FuelBrandRow: View {
    var brandName: String
    @Binding var isActive: Bool

    var body: some View {
        HStack {
            Text(brandName)
                .font(.body)
                .foregroundColor(.text)
            Spacer()
            Toggle("", isOn: $isActive)
                .toggleStyle(SwitchToggleStyle(tint: Color.green))
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        Divider()
            .frame(height: 1)
            .background(Color.gray.opacity(0.3))
            .padding(.horizontal, 16)
    }
}

#Preview {
    FuelBrandPopup()
}
