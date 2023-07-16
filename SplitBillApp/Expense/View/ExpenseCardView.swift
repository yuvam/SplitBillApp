//
//  ExpenseCardView.swift
//  SplitBillApp
//
//  Created by Yuvakumar M on 16/07/23.
//

import SwiftUI

struct ExpenseCardView: View {
    let expense: Expense
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(expense.name)
                .font(.headline)
            Text("Settled by: \(expense.settledBy)")
                .font(.subheadline)
            Text("Amount: $\(expense.amount)")
                .font(.subheadline)
            Text("Split with: \(expense.splitWith.joined(separator: ", "))")
                .font(.subheadline)
        }
        .padding()
    }
}
