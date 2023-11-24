//
//  AddNewSwiftUIView.swift
//  Contacts_integration
//
//  Created by Vipul Purbey on 21/11/23.
//

import SwiftUI

protocol AddnewDelegate {
    func dataPass(newName: String, newNumber: String)
}

struct AddNewSwiftUIView: View {
    
//    @Binding var contacts: [Contacts]
//    @Binding var showAddContact: Bool
    
    @State var newContact = Contacts()
    var delegate: AddnewDelegate?
    
    var body: some View {
        NavigationSplitView {
            VStack() {
                HStack(spacing: 20) {
                    Text("Name")
                    TextField("Name", text: $newContact.name)
                        .textFieldStyle(.roundedBorder)
                        .autocorrectionDisabled()
                }
                
                HStack(spacing: 20) {
                    Text("Number")
                    TextField("Number", text: $newContact.number)
                        .textFieldStyle(.roundedBorder)
                        .autocorrectionDisabled()
                }
                
                Button {
                    delegate?.dataPass(newName: newContact.name,
                                       newNumber: newContact.number)
                } label: {
                    Text("Add new contact")
                }
                .padding()
            }
            .padding(.trailing)
            .padding(.leading, 60)
        } detail: {
            Text("Adding new Contact")
        }
    }
}

struct AddNewSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewSwiftUIView()
    }
}
