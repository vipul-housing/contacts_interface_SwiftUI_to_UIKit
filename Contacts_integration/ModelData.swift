//
//  ModelData.swift
//  Contacts_integration
//
//  Created by Vipul Purbey on 22/11/23.
//

import UIKit
import SwiftUI

class ModelData: ObservableObject {
    @Published var contacts = [Contacts(name: "vipul", number: "1"),
                               Contacts(name: "ayush", number: "2"),
                               Contacts(name: "akash", number: "3")]
}
