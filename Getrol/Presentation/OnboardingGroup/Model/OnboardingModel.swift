//
//  OnboardingModel.swift
//  Getrol
//
//  Created by Andrii Pikus on 26.12.2024.
//


import Foundation

protocol OnboardingModel {
    func fetchRemoteData() async throws -> String
    func saveToDatabase(data: String)
    func loadFromDatabase() -> String?
}

final class OnboardingModelImpl: OnboardingModel {
    
    init() {}
    
    func fetchRemoteData() async throws -> String {
        try await withCheckedThrowingContinuation { continuation in
            DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                let success = Bool.random()
                if success {
                    continuation.resume(returning: "Fetched data from remote server")
                } else {
                    continuation.resume(throwing: NSError(domain: "NetworkError", code: -1, userInfo: nil))
                }
            }
        }
    }
    
    func saveToDatabase(data: String) {
        print("Saved data to database: \(data)")
    }
    
    func loadFromDatabase() -> String? {
        return "Data from database"
    }
}