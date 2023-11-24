//
//  DetailsInSwiftUI.swift
//  Contacts_integration
//
//  Created by Vipul Purbey on 22/11/23.
//

import SwiftUI

struct DetailsInSwiftUI: View {
    var contact: Contacts
    
    var body: some View {
        VStack(alignment: .center, spacing: 70) {
            Text(contact.name)
            Text("Edit this name")
        }
    }
}

struct DetailsInSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        DetailsInSwiftUI(contact: Contacts(name: "Sample", number: "100"))
    }
}
