//
//  UserViewModel.swift
//  SplitBillApp
//
//  Created by Yuvakumar M on 16/07/23.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published private (set) var users: [User] = []
    
    private let repository: UserRepositoryType
    
    init(repository: UserRepositoryType = UserRepository()) {
        self.repository = repository
        users = repository.loadUsers()
    }
    
    func addUser(name: String) {
        let newUser = User(name: name)
        users.append(newUser)
        repository.saveUsers(users)
    }
    
    func deleteUser(at index: Int) {
        users.remove(at: index)
        repository.saveUsers(users)
    }
    
    func addExpense(expense: Expense) {
        users[findBy: expense.settledBy]?.addExpense(amount: expense.amount, splitWith: users[findAllBy: expense.splitWith])
        repository.saveUsers(users)
        objectWillChange.send()
    }
    
    func removeExpense(expense: Expense) {
        users[findBy: expense.settledBy]?.removeExpense(amount: expense.amount, splitWith: users[findAllBy: expense.splitWith])
        objectWillChange.send()
        repository.saveUsers(users)
    }
    
    func getAmountOwed(from user: String, for expense: Expense) -> Int? {
        let person = users.first { $0.name == user }
        return person?.owedTo[expense.settledBy]
    }
}
