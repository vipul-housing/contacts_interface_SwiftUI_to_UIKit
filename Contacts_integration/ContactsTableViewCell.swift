//
//  ContactsTableViewCell.swift
//  Contacts_integration
//
//  Created by Vipul Purbey on 21/11/23.
//

import UIKit
import SwiftUI

//protocol 

struct ContactsTableViewCellRepresentable: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(view: self)
    }
    
    
    var contact: Contacts
    
    func makeUIView(context: Context) -> UITableViewCell {
//        let cell = UINib(nibName: "ContactsTableViewCell", bundle: nil).instantiate(withOwner: nil) as! UIView
         UITableViewCell()
//        var cellConfig = UIListContentConfiguration.subtitleCell()
//        cellConfig.text = contact.name
//        cell.contentConfiguration = cellConfig
//        return cell
    }
    
    func updateUIView(_ uiView: UITableViewCell, context: Context) {
        var cellConfig = UIListContentConfiguration.subtitleCell()
        cellConfig.text = contact.name
        uiView.contentConfiguration = cellConfig
        
    }
    
    typealias UIViewType = UITableViewCell
    
    class Coordinator: NSObject {
        var control: ContactsTableViewCellRepresentable
        
        init(view: ContactsTableViewCellRepresentable) {
            self.control = view
        }
    }
}

