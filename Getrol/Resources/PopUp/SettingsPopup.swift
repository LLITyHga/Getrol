//
//  SettingsPopup.swift
//  Getrol
//
//  Created by Andrii Pikus on 13.01.2025.
//

import SwiftUI

struct SettingsPopup: View {

    @Environment(\.dismissModal) private var dismissModal
    @State private var notificationsEnabled = true
    var onDismis: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            dragHandle()
                .gesture(
                    DragGesture()
                        .onEnded { value in
                            if value.translation.height > 0 {
                                    dismissModal()
                                onDismis()
                            }
                        }
                )

            // Заголовок
            Text(LS.Home.Popup.title)
                .font(.h2)
                .foregroundColor(.text)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 20)
                .padding(.bottom, 16)

            // Сповіщення (перемикач)
            HStack {
                Text(LS.Home.Popup.notifications)
                    .font(.body)
                    .foregroundStyle(.text)
                Spacer()
                Toggle("", isOn: $notificationsEnabled)
                    .toggleStyle(SwitchToggleStyle(tint: Color.green))
            }
            .padding([.horizontal, .vertical], 16)
            Divider()
                .frame(height: 1)
                .background(Color.gray.opacity(0.3))
                .padding(.horizontal, 16)
            // Кнопка "Локація"
            Button(action: {
                print("Локація натиснута")
            }) {
                HStack {
                    Text(LS.Home.Popup.location)
                        .font(.body)
                        .foregroundStyle(.text)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding([.horizontal, .vertical], 16)
            }
            Divider() // Лінія під контентом (підкреслення)
                .frame(height: 1)
                .background(Color.gray.opacity(0.3))
                .padding(.horizontal, 16) // Вирівнювання з текстом

            // Кнопка "Про проект"
            Button(action: {
                print("Про проект натиснуто")
            }) {
                HStack {
                    Text(LS.Home.Popup.aboutProject)
                        .font(.body)
                        .foregroundStyle(.text)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding([.horizontal, .vertical], 16)
            }
            Divider() 
                .frame(height: 1)
                .background(Color.gray.opacity(0.3))
                .padding(.horizontal, 16)

            // Кнопка "Політика конфіденційності"
            Button(action: {
                print("Політика конфіденційності натиснута")
            }) {
                HStack {
                    Text(LS.Home.Popup.privacyPolicy)
                        .font(.body)
                        .foregroundStyle(.text)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding([.horizontal, .vertical], 16)
            }
            Divider()
                .frame(height: 1)
                .background(Color.gray.opacity(0.3))
                .padding(.horizontal, 16)
                .padding(.bottom, 40)
        }
        .frame(width: 342, alignment: .center)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 7)
    }
}

#Preview {
  //  SettingsPopup()
}
