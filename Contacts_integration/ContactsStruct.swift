//
//  ContactsStruct.swift
//  Contacts_integration
//
//  Created by Vipul Purbey on 21/11/23.
//

import UIKit
import SwiftUI


struct Contacts: Identifiable, Equatable {
    var id = UUID()
    
    var name: String
    var number: String
    
    init() {
        self.name = ""
        self.number = ""
    }
    
    init(name: String, number: String){
        self.name = name
        self.number = number
    }
}
