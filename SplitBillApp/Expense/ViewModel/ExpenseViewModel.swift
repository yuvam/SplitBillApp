//
//  ExpenseViewModel.swift
//  SplitBillApp
//
//  Created by Yuvakumar M on 16/07/23.
//

import Foundation

class ExpenseViewModel: ObservableObject {
    @Published private (set) var expenses: [Expense] = []
    
    private let repository: ExpenseRepositoryType
    
    init(repository: ExpenseRepositoryType = ExpenseRepository()) {
        self.repository = repository
        expenses = repository.loadExpenses()
    }
    
    func addExpense(expense: Expense) {
        expenses.append(expense)
        repository.saveExpenses(expenses)
    }
    
    func deleteExpense(at index: Int) {
        expenses.remove(at: index)
        repository.saveExpenses(expenses)
    }
    
}
