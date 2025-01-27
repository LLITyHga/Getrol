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
    @State private var currentView: PopupViewState = .settings
    var onDismis: () -> Void
    var onLocaton: () -> Void

    
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
            Group {
                 switch currentView {
                 case .settings:
                     Settings()
                 case .privacyPolicy:
                     Privacy()
                 case .aboutProject:
                     About()
                 }
             }.frame(height: 350)
        }
        .frame(width: 342)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 7)
    }
}

extension SettingsPopup {
    
    @ViewBuilder
    func Settings() -> some View {
        VStack(spacing: 0) {
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
                    .font(._body)
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
                onLocaton()
            }) {
                HStack {
                    Text(LS.Home.Popup.location)
                        .font(._body)
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
                currentView = .aboutProject
            }) {
                HStack {
                    Text(LS.Home.Popup.aboutProject)
                        .font(._body)
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
                currentView = .privacyPolicy
            }) {
                HStack {
                    Text(LS.Home.Popup.privacyPolicy)
                        .font(._body)
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
    }
    
    @ViewBuilder
    func About() -> some View {
        ScrollView {
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    Text("Про нас")
                        .font(.h2)
                        .foregroundStyle(.text)
                        .padding(.vertical, 40)
                    Spacer()
                }
                
                Text("Чи знали ви, що різниця в ціні на пальне між найдешевшою та найдорожчою заправкою може становити до 8 гривень за літр?")
                    .font(.bodyMedum)
                    .padding(.bottom, 16)
                
                Text("""
        Getrol надає вам актуальні ціни на пальне. 
        Понад 2000 автозаправних станцій завантажують ціни на пальне в режимі реального часу. Ви можете знайти найдешевше пальне поруч із вами будь-коли та будь-де. З увімкненими сповіщеннями ви отримуватимете повідомлення, коли ціна на вашій улюбленій заправці знизиться!
        Функція "Моя подорож" допоможе вам знайти найдешевше пальне на маршруті між будь-якими двома точками.
        """)
                .font(._body)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 40)
        }
    }
    
    @ViewBuilder
    func Privacy() -> some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Заголовок
                    HStack(alignment: .center, spacing: 0) {
                        Spacer()
                        Text("Політика конфіденційності")
                            .font(.h2)
                            .foregroundStyle(.text)
                            .padding(.bottom, 8)
                        Spacer()
                    }
                    
                    // Вступ
                    Text("Вступ")
                        .font(.bodyMedum)
                        .foregroundStyle(.text)
                    Text("Ця політика конфіденційності пояснює, як Getrol (далі - \"Додаток\") збирає, використовує та захищає ваші дані.")
                        .font(._body)
                        .foregroundStyle(.text)

                    // Які дані ми збираємо
                    Text("Які дані ми збираємо")
                        .font(.bodyMedum)
                        .foregroundStyle(.text)

                    
                    VStack(alignment: .leading, spacing: 8) {
                        bulletPoint(text: "Дані про місцезнаходження (за вашою згодою)")
                        bulletPoint(text: "Інформація про пристрій")
                        bulletPoint(text: "Історія пошуків")
                        bulletPoint(text: "Обрані вами АЗС")
                        bulletPoint(text: "Маршрути подорожей (якщо ви використовуєте цю функцію)")
                    }
                    
                    // Як ми використовуємо ваші дані
                    Text("Як ми використовуємо ваші дані")
                        .font(.bodyMedum)
                        .foregroundStyle(.text)

                    
                    VStack(alignment: .leading, spacing: 8) {
                        bulletPoint(text: "Для пошуку найближчих АЗС та найвигідніших цін")
                        bulletPoint(text: "Для надсилання сповіщень про зміну цін на обраних АЗС")
                        bulletPoint(text: "Для побудови оптимальних маршрутів")
                        bulletPoint(text: "Для покращення роботи Додатку")
                    }
                    
                    // Дані про місцезнаходження
                    Text("Дані про місцезнаходження")
                        .font(.bodyMedum)
                        .foregroundStyle(.text)

                    Text("""
            Додаток використовує дані про місцезнаходження для:
            - Пошуку найближчих АЗС
            - Розрахунку оптимальних маршрутів
            - Надання персоналізованих рекомендацій
            """)
                    .font(._body)
                    .foregroundStyle(.text)

                    Text("Ви можете будь-коли вимкнути доступ до геолокації в налаштуваннях пристрою.")
                        .font(._body)
                        .foregroundStyle(.text)
                    
                    // Зберігання та захист даних
                    Text("Зберігання та захист даних")
                        .font(.bodyMedum)
                        .foregroundStyle(.text)

                    Text("""
            - Всі дані зберігаються на захищених серверах
            - Ми не продаємо ваші персональні дані третім особам
            - Історія пошуків зберігається лише на вашому пристрої
            """)
                    .font(._body)
                    .foregroundStyle(.text)
                    
                    // Ваші права
                    Text("Ваші права")
                        .font(.bodyMedum)
                        .foregroundStyle(.text)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        bulletPoint(text: "Видалити свій обліковий запис")
                        bulletPoint(text: "Відкликати дозвіл на використання геолокації")
                        bulletPoint(text: "Очистити історію пошуків")
                        bulletPoint(text: "Вимкнути сповіщення")
                    }
                    
                    // Зміни до політики
                    Text("Зміни до політики")
                        .font(.bodyMedum)
                        .foregroundStyle(.text)

                    Text("Ми можемо оновлювати цю політику конфіденційності. Про суттєві зміни ви отримаєте повідомлення через Додаток.")
                        .font(._body)
                        .foregroundStyle(.text)

                }
                .padding()
            }
    }
    
    @ViewBuilder
    func bulletPoint(text: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Circle()
                .frame(width: 4, height: 4)
                .foregroundColor(.black)
                .padding(.top, 4)
            Text(text)
                .font(._body)
                .foregroundStyle(.text)

        }
    }
}

enum PopupViewState {
    case settings
    case privacyPolicy
    case aboutProject
}
