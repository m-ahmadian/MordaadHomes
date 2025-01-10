//
//  ContentViewModel.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-27.
//

import Foundation
import Combine
import CoreLocation

@MainActor
class ContentViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var isAuthenticating = false
    @Published var currentUser: User?
    @Published var currentLocation: CLLocationCoordinate2D?
    @Published var showAlert = false
    @Published var authError: AuthError?
    
    private var cancellables = Set<AnyCancellable>()
    private var locationManager = LocationManager()
    private var authService: AuthService
    private var userService: UserService
    
    init(authService: AuthService, userService: UserService) {
        self.authService = authService
        self.userService = userService
        
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        authService.$didAuthenticateUser.sink { [weak self] authenticated in
            guard let self else { return }
            self.isAuthenticated = authenticated
            if authenticated {
                self.fetchCurrentUser()
            } else {
                self.currentUser = nil
            }
        }
        .store(in: &cancellables)
        
        locationManager.$location.sink { [weak self] coordinates in
            guard let self else { return }
            self.currentLocation = coordinates
        }.store(in: &cancellables)
    }
    
    func fetchCurrentUser() {
        Task { self.currentUser = try await userService.fetchCurrentUser() }
    }
    
    func login(email: String, password: String) async {
        isAuthenticating = true
        
        do {
            try await authService.login(withEmail: email, password: password)
            isAuthenticating = false
        } catch {
            self.showAlert = true
            isAuthenticating = false
            self.authError = .invalidEmail
        }
    }
    
    func logout() {
        authService.logout()
    }
}
