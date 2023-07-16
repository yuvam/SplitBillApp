//
//  UserModel.swift
//  SplitBillApp
//
//  Created by Yuvakumar M on 16/07/23.
//

import Foundation

class User: Codable, ObservableObject {
    var name: String = ""
    var debit: Int = 0
    var credit: Int = 0
    var owedTo: [String: Int] = [:]
    
    init(name: String) {
        self.name = name
        self.credit = 0
        self.debit = 0
        self.owedTo = [:]
    }
    
    func addExpense(amount: Int, splitWith: [User]) {
        let splitAmount = amount / (splitWith.count + 1)
        for person in splitWith {
            person.owedTo[self.name, default: 0] += splitAmount
            person.debit += splitAmount
            self.credit += splitAmount
        }
    }
    
    func removeExpense(amount: Int, splitWith: [User]) {
        let splitAmount = amount / (splitWith.count + 1)
        for person in splitWith {
            person.owedTo[self.name, default: 0] -= splitAmount
            person.debit -= splitAmount
            self.credit -= splitAmount
        }
    }
}

extension User: Equatable {
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.name == rhs.name
    }
}

extension Array where Element == User {
    
    subscript(findBy name: String) -> User? {
        first(where: { $0.name == name })
    }
    
    subscript(findAllBy names: [String]) -> [User] {
        filter { names.contains($0.name) }
    }
}
