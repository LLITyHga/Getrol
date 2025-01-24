//
//  AboutPopup.swift
//  Getrol
//
//  Created by Andrii Pikus on 23.01.2025.
//

import SwiftUI

struct AboutPopup: View {
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
            Text("Про нас")
                .font(.h2)
                .foregroundStyle(.text)
            
            Text("Чи знали ви, що різниця в ціні на пальне між найдешевшою та найдорожчою заправкою може становити до 8 гривень за літр?")
                .font(.bodyMedum)
                
            Text("""
            Getrol надає вам актуальні ціни на пальне. 
            Понад 2000 автозаправних станцій завантажують ціни на пальне в режимі реального часу. Ви можете знайти найдешевше пальне поруч із вами будь-коли та будь-де. З увімкненими сповіщеннями ви отримуватимете повідомлення, коли ціна на вашій улюбленій заправці знизиться!
            Функція "Моя подорож" допоможе вам знайти найдешевше пальне на маршруті між будь-якими двома точками.
            """)
            .font(._body)
        }
    }
}

