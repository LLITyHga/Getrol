//
//  Injection.swift
//  Getrol
//
//  Created by Andrii Pikus on 25.12.2024.
//


import Swinject

final class Injection {
    
    static let shared = Injection()
    
    var containr: Container {
        get {
            if _container == nil {
                _container = buildContainer()
            }
            return _container!
        }
        set { _container = newValue }
    }
    
    private var _container: Container?
    
    private init() {}
    
    private func buildContainer() -> Container {
        let container = Container()
        
        // TODO: - Example add dependencies
//        container.register(DependencyProtocol.self) { _ in
//            return DependencyImpl()
//        }
        
        return container
    }
}

@propertyWrapper struct Injected<T> {
    
    let wrappedValue: T
    
    init() {
        self.wrappedValue = Injection.shared.containr.resolve(T.self)!
    }
}