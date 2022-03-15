//
//  ImageViewController.swift
//  LoginApp
//
//  Created by Paul Matar on 14.03.2022.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: user.person.image)
    }
}

