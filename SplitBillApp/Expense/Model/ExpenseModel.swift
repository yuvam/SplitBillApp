//
//  ExpenseModel.swift
//  SplitBillApp
//
//  Created by Yuvakumar M on 16/07/23.
//

import Foundation

struct Expense: Codable, Identifiable {
    var id = UUID()
    let name: String
    let amount: Int
    let settledBy: String
    let splitWith: [String]
}
