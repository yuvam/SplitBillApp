//
//  ExpenseAddEditView.swift
//  SplitBillApp
//
//  Created by Yuvakumar M on 16/07/23.
//

import SwiftUI

struct ExpenseAddEditView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    
    @State private var name = ""
    @State private var amount = ""
    @State private var settledBy = "Anu"
    @State private var splitWith: [String] = []

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Amount", text: $amount)
                Picker("Settled By", selection: $settledBy) {
                    ForEach(userViewModel.users, id: \.name) {
                        Text($0.name)
                    }
                }
                .onChange(of: settledBy, perform: { newValue in
                    splitWith.removeAll()
                })
                .pickerStyle(.menu)
                Text("Split with")
                ForEach(splitWithUsers(), id: \.self) { user in
                    Button(action: {
                        if splitWith.contains(user) {
                            splitWith.removeAll(where: { $0 == user })
                        } else {
                            splitWith.append(user)
                        }
                    }) {
                        HStack {
                            Image(systemName: splitWith.contains(user) ? "checkmark.square.fill" : "square")
                            Text(user)
                        }
                    }
                    .padding(5)
                }
                Button("Save") {
                    let amountInt = Int(amount) ?? 0
                    let newExpense = Expense(name: name, amount: amountInt, settledBy: settledBy, splitWith: splitWith)
                    expenseViewModel.addExpense(expense: newExpense)
                    userViewModel.addExpense(expense: newExpense)
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationTitle("Add Expense")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Cancel")
                    }
                }
            }
        }
    }
    
    func splitWithUsers() -> [String] {
        userViewModel.users.filter{ $0.name != settledBy }.map { $0.name }
    }
}

