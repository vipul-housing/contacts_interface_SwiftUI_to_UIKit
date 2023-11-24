//
//  ContactsList.swift
//  Contacts_integration
//
//  Created by Vipul Purbey on 21/11/23.
//

import SwiftUI

struct ContactsList: View {
//    @State var contacts: [Contacts]
//    @State var showIntermediateAddPage = false
    @ObservedObject var viewModel: ModelData
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.contacts) { contact in
                    NavigationLink {
                        ContactDetailsRepresentable(contact: contact,
                                                    viewModel: viewModel)
                    } label: {
                        ZStack {
                            ContactsTableViewCellRepresentable(contact: contact)
                            Color(.init(red: 1, green: 0, blue: 0, alpha: 0))
                            
//                            Text("Click")
//                                .padding(<#T##insets: EdgeInsets##EdgeInsets#>, )
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden()
            .navigationTitle("Contacts")
            
            Button {
                viewModel.contacts.removeLast()
            } label: {
                Text("Delete Last ")
            }
            .disabled(viewModel.contacts.count == 0)

            NavigationLink {
                IntermediateAddRepresentable(viewModel: viewModel)
            } label: {
                Label("Add", systemImage: "person")
                    .foregroundColor(.accentColor)
            }

        }
    }
}

struct ContactsList_Previews: PreviewProvider {
    static var previews: some View {
        ContactsList(viewModel: ModelData())
    }
}
