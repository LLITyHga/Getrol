//
//  HomeView.swift
//  Getrol
//
//  Created by Andrii Pikus on 03.01.2025.
//

import MapKit
import SwiftUI

struct HomeView: View {  //TODO: додати протоколозалежність
    
    @StateObject  var viewModel: HomeViewModel
    //
    //    init(viewModel: HomeViewModel) {
    //        _viewModel = StateObject(wrappedValue: viewModel)
    //    }
    
    var body: some View {
        ZStack {
            Map(position: $viewModel.cameraPosition) {
                // Карта без додаткових маркерів
            }
            .mapStyle(.standard())
            .ignoresSafeArea(edges: .all)
            
            VStack(spacing: 0) {
                searchField()
                RouteButtons()
                Spacer()
                MenuButtons()
                HomeSheet(viewModel: viewModel)
                    .padding(.top, 16)
            }
            .ignoresSafeArea()
            .padding(.top, 24)
        }
    }
}

extension HomeView {
    @ViewBuilder
    func searchField() -> some View {
        TextField(
            LS.Home.search, text: $viewModel.searchText,
            onEditingChanged: { _ in
                viewModel.onSearchQueryChanged()
            }
        )
        .padding(.horizontal, 16)
        .frame(height: 56)
        .background(.bg)
        .cornerRadius(8)
        .padding(.horizontal, 16)
    }
    
    @ViewBuilder
    func RouteButtons() -> some View {
        HStack(spacing: 0) {
            Spacer()
            VStack(spacing: 0) {
                Button(action: viewModel.onRouteAction) {
                    Image(.routeImg)
                        .frame(width: 42, height: 42)
                }
                .padding(.vertical, 16)
                .padding(.trailing, 16)
                
                Button(action: viewModel.onLocationAction) {
                    Image(.locationImg)
                        .frame(width: 42, height: 42)
                }
                .padding(.trailing, 16)
            }
        }
    }
    
    @ViewBuilder
    func MenuButtons() -> some View {
        ZStack {
            HStack(spacing: 16) {
                Button(action: {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                        viewModel.toggleMenu()
                    }
                }) {
                    Image(viewModel.isMenuOpen ? .meuOpeImg : .menulosedImg)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 42, height: 42)
                }
                .padding(.leading, 16)
                
                // Кнопка 1
                Button(action: { viewModel.onMenuAction(.menu1) }) {
                    Image(.tupeFuelImg)
                        .resizable()
                        .if(viewModel.isMenuOpen) { view in
                            view.scaledToFit()
                                .padding(.leading, 24)
                        }
                        .frame(height: 42)
                        .if(!viewModel.isMenuOpen) { view in
                            view
                                .frame(width: 42)
                                .offset(x: -50)
                        }
                        .opacity(viewModel.isMenuOpen ? 1 : 0)
                }
                .zIndex(-1)
                
                // Кнопка 2
                Button(action: { viewModel.onMenuAction(.menu2) }) {
                    Image(.markImg)
                        .resizable()
                        .if(viewModel.isMenuOpen) { view in
                            view.scaledToFit()
                        }
                        .frame(height: 42)
                        .if(!viewModel.isMenuOpen) { view in
                            view
                                .frame(width: 42)
                                .offset(x: -115)
                        }
                        .opacity(viewModel.isMenuOpen ? 1 : 0)
                }
                .zIndex(-2)
                
                // Кнопка налаштувань
                Button(action: { viewModel.onMenuAction(.settings) }) {
                    Image(.settigsImg)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 42, height: 42)
                        .if(!viewModel.isMenuOpen) { view in
                            view.offset(x: -200)
                        }
                        .opacity(viewModel.isMenuOpen ? 1 : 0)
                }
                .zIndex(-3)
                
                .if(!viewModel.isMenuOpen) { view in
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    let model = HomeModel()
    let vm = HomeViewModel(model: model)
    HomeView(viewModel: vm)
}
