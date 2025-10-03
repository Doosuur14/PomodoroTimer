//
//  UserService.swift
//  TimerApp
//
//  Created by Faki Doosuur Doris on 16.04.2024.
//

import Foundation

 class UserService {
    static let shared = UserService()

    var users: [User] = [User( email: "doosuur14@gmail.com", password: "12345")]

     init() {}

    func login(email: String, password: String, completion: @escaping((Result<User, LoginError>) -> ())) {
        
        do {
            if let user = users.first(where: {$0.email == email && $0.password == password}) {
                print("User is found")
                completion(.success(user))
            } else {
                print("User is not found")
                completion(.failure(LoginError.userNotFound))
            }
        }
    }
}

enum LoginError: Error {
    case userNotFound
}
