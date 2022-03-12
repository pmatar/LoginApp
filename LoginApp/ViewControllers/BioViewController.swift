//
//  BioViewController.swift
//  LoginApp
//
//  Created by Paul Matar on 11.03.2022.
//

import UIKit

class BioViewController: UIViewController {

    @IBOutlet var bioTextView: UITextView!

    var user: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bioTextView.text = user?.desciption ?? ""
//        self.title = user?.fullName ?? ""
    }
}
