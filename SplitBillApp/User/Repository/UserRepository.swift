//
//  UserRepository.swift
//  SplitBillApp
//
//  Created by Yuvakumar M on 16/07/23.
//

import Foundation

protocol UserRepositoryType {
    func saveUsers(_ users: [User])
    func loadUsers() -> [User]
}

class UserRepository: UserRepositoryType {

    private let usersKey = "users"
    
    func saveUsers(_ users: [User]) {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(users) {
            UserDefaults.standard.set(encodedData, forKey: usersKey)
        }
    }
    
    func loadUsers() -> [User] {
        let decoder = JSONDecoder()
        if let usersData = UserDefaults.standard.data(forKey: usersKey),
           let users = try? decoder.decode([User].self, from: usersData) {
            return users
        }
        return []
    }
}
