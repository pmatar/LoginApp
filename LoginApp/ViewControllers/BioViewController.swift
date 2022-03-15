//
//  BioViewController.swift
//  LoginApp
//
//  Created by Paul Matar on 11.03.2022.
//

import UIKit

class BioViewController: UIViewController {

    @IBOutlet var bioTextView: UITextView!

    var user: User!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? ImageViewController else { return }
        imageVC.user = user
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bioTextView.text = user.person.desciption
        title = user.person.fullName
    }
}
