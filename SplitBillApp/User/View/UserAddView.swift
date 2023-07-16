//
//  UserAddView.swift
//  SplitBillApp
//
//  Created by Yuvakumar M on 16/07/23.
//

import SwiftUI

struct UserAddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: UserViewModel
    
    @State private var name = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Button("Save") {
                    viewModel.addUser(name: name)
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationTitle("Add User")
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
}
