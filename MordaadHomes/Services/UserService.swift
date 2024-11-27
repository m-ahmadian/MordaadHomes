//
//  UserService.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-27.
//

import Foundation

class UserService {
    func fetchCurrentUser() async throws -> User {
        return User(
            accountType: .guest,
            fullName: "John Doe",
            email: "johndoe@gmail.com",
            profileImageURL: "male-profile-photo"
        )
    }
}
