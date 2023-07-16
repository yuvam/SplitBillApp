//
//  UserListView.swift
//  SplitBillApp
//
//  Created by Yuvakumar M on 16/07/23.
//

import SwiftUI

struct UserListView: View {
    
    @EnvironmentObject var viewModel: UserViewModel
    @State private var isPresentingUserAdd = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.users, id: \.name) { user in
                    Text(user.name)
                }
                .onDelete { indexSet in
                    viewModel.deleteUser(at: indexSet.first ?? 0)
                }
            }
            .navigationTitle("Users")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isPresentingUserAdd = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isPresentingUserAdd) {
                UserAddView()
            }
        }
    }
}
