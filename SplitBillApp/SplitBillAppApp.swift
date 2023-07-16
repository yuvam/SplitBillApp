//
//  SplitBillAppApp.swift
//  SplitBillApp
//
//  Created by Yuvakumar M on 16/07/23.
//

import SwiftUI

@main
struct SplitBillAppApp: App {
    
    let userViewModel = UserViewModel()
    let expenseViewModel = ExpenseViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                ExpenseListView()
                    .tabItem {
                        Label("Expenses", systemImage: "list.bullet")
                    }
                    .environmentObject(expenseViewModel)
                    .environmentObject(userViewModel)
                ExpenseSummaryView()
                    .tabItem {
                        Label("Summary", systemImage: "list.bullet.below.rectangle")
                    }
                    .environmentObject(userViewModel)
                UserListView()
                    .tabItem {
                        Label("Users", systemImage: "person.3")
                    }
                    .environmentObject(userViewModel)
            }
        }
    }
}
