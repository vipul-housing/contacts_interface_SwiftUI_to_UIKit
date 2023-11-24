//
//  ContactDetailViewController.swift
//  Contacts_integration
//
//  Created by Vipul Purbey on 21/11/23.
//

import UIKit
import SwiftUI

protocol Datapass{
    func datapassing(newName: String)
}

class ContactDetailViewController: UIViewController {
    
    var delegate: Datapass!
    var contact: Contacts?
    
    @IBOutlet weak var textField: UITextField!
    @IBAction func changeContactNameButton(_ sender: UIButton) {
        
        guard let newName = textField.text else{
            return
        }
//        contact?.name = newName
        delegate.datapassing(newName: newName)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configure()
        extractSwiftUIView()
    }
    
    func configure(){
    }
    
    func extractSwiftUIView() {
        let hostView = UIHostingController(rootView: DetailsInSwiftUI(contact: contact!))
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(hostView.view)

        let constaints = [
            hostView.view.topAnchor.constraint(equalTo: view.topAnchor),

            hostView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),

//            hostView.view.widthAnchor.constraint(equalTo: view.widthAnchor),
            hostView.view.heightAnchor.constraint(equalToConstant: 500)
            ]

        self.view.addConstraints(constaints)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


struct ContactDetailsRepresentable: UIViewControllerRepresentable  {
    func makeCoordinator() -> Coordinator {
        Coordinator(control: self)
    }
    
    
    var contact: Contacts 
    @ObservedObject var viewModel: ModelData
    
    func makeUIViewController(context: Context) -> ContactDetailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ContactDetailViewController") as! ContactDetailViewController
        
        vc.contact = contact
        vc.delegate = context.coordinator
        return vc
    }
    
    func updateUIViewController(_ uiViewController: ContactDetailViewController, context: Context) {
        guard let a = viewModel.contacts.firstIndex(of: contact) else {
            return
        }
        
        uiViewController.contact?.name = viewModel.contacts[a].name
        uiViewController.extractSwiftUIView()
    }
    
    typealias UIViewControllerType = ContactDetailViewController
    
    class Coordinator: NSObject, Datapass {
        var control: ContactDetailsRepresentable
        
        init(control: ContactDetailsRepresentable) {
            self.control = control
        }
        
        func datapassing(newName: String) {
            if let a = control.viewModel.contacts.firstIndex(of: control.contact){
                control.viewModel.contacts[a].name = newName
                control.contact.name = newName
            }
        }
    }
}
