//
//  ExpenseListView.swift
//  SplitBillApp
//
//  Created by Yuvakumar M on 16/07/23.
//

import SwiftUI

struct ExpenseListView: View {
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var isPresentingExpenseAdd = false
    @State private var isPresentingNoUserFound = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenseViewModel.expenses) { expense in
                    ExpenseCardView(expense: expense)
                }
                .onDelete { indexSet in
                    let expense = expenseViewModel.expenses[indexSet.first ?? 0]
                    expenseViewModel.deleteExpense(at: indexSet.first ?? 0)
                    userViewModel.removeExpense(expense: expense)
                }
            }
            .navigationTitle("Expenses")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        guard userViewModel.users.isEmpty else {
                            isPresentingExpenseAdd = true
                            return
                        }
                        isPresentingNoUserFound = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isPresentingExpenseAdd) {
                ExpenseAddEditView()
            }
            .alert("No User Found.!", isPresented: $isPresentingNoUserFound, actions: {}, message: {
                Text("Please go to Users tab to add user then add your expenses here.!")
            })
        }
    }
}
