//
//  IntermediateAddViewController.swift
//  Contacts_integration
//
//  Created by Vipul Purbey on 22/11/23.
//

import UIKit
import SwiftUI

//protocol IntermediateDataPass{
//    func dataPass(newName: String)
//}

class IntermediateAddViewController: UIViewController {

    var contact: Contacts = Contacts(name: "New Contact Name", number: "0")
    @IBOutlet weak var contactNameLabel: UILabel!
    
    var delegate: AddnewDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configure()
    }
    
    func configure() {
        contactNameLabel.text = contact.name
    }
    
    @IBAction func EditButtonPressed(_ sender: UIButton) {
        let hostingController = UIHostingController(rootView: AddNewSwiftUIView(delegate: self.delegate))
        self.navigationController?.pushViewController(hostingController, animated: true)
    }
    
    @IBAction func setButtonPressed(_ sender: UIButton) {
//        delegate.dataPass(newName: contactNameLabel.text!)
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

struct IntermediateAddRepresentable: UIViewControllerRepresentable {
    
//    func dataPass(newName: String) {
//        var contact = Contacts(name: newName, number: "45")
//        viewModel.contacts.append(contact)
//    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(control: self)
    }
    
    @ObservedObject var viewModel: ModelData
    
    func makeUIViewController(context: Context) -> IntermediateAddViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "IntermediateAddViewController") as! IntermediateAddViewController
        
        vc.delegate = context.coordinator
        return vc
    }
    
    func updateUIViewController(_ uiViewController: IntermediateAddViewController, context: Context) {
        uiViewController.contactNameLabel.text = viewModel.contacts.last?.name
        return
    }
    
//    typealias UIViewControllerType = IntermediateAddViewController
    
    class Coordinator: NSObject, AddnewDelegate {
        func dataPass(newName: String, newNumber: String) {
            control.viewModel.contacts.append(Contacts(name: newName, number: newNumber))
        }
        
        var control: IntermediateAddRepresentable
        
        init(control: IntermediateAddRepresentable) {
            self.control = control
        }
    }
}
