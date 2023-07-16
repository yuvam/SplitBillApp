//
//  ExpenseRepository.swift
//  SplitBillApp
//
//  Created by Yuvakumar M on 16/07/23.
//

import Foundation

protocol ExpenseRepositoryType {
    func saveExpenses(_ expenses: [Expense])
    func loadExpenses() -> [Expense]
}

class ExpenseRepository: ExpenseRepositoryType {
    
    private let expensesKey = "expenses"
    
    func saveExpenses(_ expenses: [Expense]) {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(expenses) {
            UserDefaults.standard.set(encodedData, forKey: expensesKey)
        }
    }
    
    func loadExpenses() -> [Expense] {
        let decoder = JSONDecoder()
        if let expensesData = UserDefaults.standard.data(forKey: expensesKey),
           let expenses = try? decoder.decode([Expense].self, from: expensesData) {
            return expenses
        }
        return []
    }
}
