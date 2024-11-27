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
    @Published var currentUser: User?
    @Published var currentLocation: CLLocationCoordinate2D?
    
    private var cancellables = Set<AnyCancellable>()
    private var authService: AuthService
    private var userService: UserService
    
    private var locationManager = LocationManager()
    
    init(authService: AuthService, userService: UserService) {
        self.authService = authService
        self.userService = userService
        
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        authService.$didAuthenticateUser.sink { [weak self] authenticated in
            guard let self else { return }
            self.isAuthenticated = authenticated
            guard authenticated else { return }
            self.fetchCurrentUser()
        }
        .store(in: &cancellables)
        
        locationManager.$location.sink { [weak self] coordinate in
            guard let self else { return }
            self.currentLocation = coordinate
        }.store(in: &cancellables)
    }
    
    func fetchCurrentUser() {
        Task {
            self.currentUser = try await userService.fetchCurrentUser()
        }
    }
}
