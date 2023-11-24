//
//  ViewController.swift
//  Contacts_integration
//
//  Created by Vipul Purbey on 21/11/23.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        showSwiftUIList()
    }
    
//    var contacts = [Contacts(name: "vipul", number: "1"),
//                    Contacts(name: "ayush", number: "2"),
//                    Contacts(name: "akash", number: "3")]
    func showSwiftUIList() {
        let uiHostController = UIHostingController(rootView: ContactsList(viewModel: ModelData()))
        self.navigationController?.pushViewController(uiHostController, animated: false)
    }

}

