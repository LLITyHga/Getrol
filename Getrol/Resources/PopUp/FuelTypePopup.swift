//
//  FuelTypePopup.swift
//  Getrol
//
//  Created by Andrii Pikus on 13.01.2025.
//

import SwiftUI

struct FuelTypePopup: View {
    @Environment(\.dismissModal) private var dismissModal
    @State private var selectedFuel: String = "Бензин А-95"
    let fuelOptions = ["Бензин А-92", "Бензин А-95", "Бензин А-98", "Дизель", "Газ"]
    var onDismis: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            dragHandle()
                .gesture(
                    DragGesture()
                        .onEnded { value in
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                if value.translation.height > 0 {
                                    dismissModal()
                                    onDismis()
                                }
                            }
                        }
                )

            Text(LS.Home.Popup.fuelTypeTitle)
                .font(.h2)
                .foregroundColor(.text)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 20)
                .padding(.bottom, 8)

            Text(LS.Home.Popup.fuelTypeDescription)
                .font(.small)
                .foregroundColor(.text)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 16)

            Picker(LS.Home.Popup.fuelTypeTitle, selection: $selectedFuel) {
                ForEach(fuelOptions, id: \.self) { fuel in
                    Text(fuel)
                        .font(.body)
                        .foregroundColor(.text)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(height: 150)
            .clipped()
            .padding(.horizontal, 16)
            .padding(.bottom, 40)

        }
        .frame(width: 342, alignment: .center)
        .background(.bg)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 7)
    }
}

#Preview {
    FuelTypePopup(onDismis: {print("Dismissed")})
}
