//
//  ExpenseSummaryView.swift
//  SplitBillApp
//
//  Created by Yuvakumar M on 16/07/23.
//

import SwiftUI

struct ExpenseSummaryView: View {
    
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        NavigationView {
            List(userViewModel.users, id: \.name) { user in
                VStack {
                    ForEach(user.owedTo.sorted(by: >), id: \.key) { key, value in
                        Text("\(user.name) owes \(key) $\(value)")
                    }
                    let balance = user.credit - user.debit
                    if balance > 0 {
                        Text("\(user.name) owns \(balance)")
                    } else {
                        Text("\(user.name) owns $0")
                    }
                }
                .padding()
            }
            .navigationTitle("Expense Summary")
        }
        .onAppear {
            dump(userViewModel.users)
        }
    }
}

