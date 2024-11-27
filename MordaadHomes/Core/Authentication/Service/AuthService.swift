//
//  AuthService.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-27.
//

import Foundation

class AuthService {
    @Published var didAuthenticateUser = false
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        didAuthenticateUser = true
    }
    
    @MainActor
    func signout() {
        didAuthenticateUser = false
    }
}
