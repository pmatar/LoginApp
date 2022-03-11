//
//  ViewController.swift
//  LoginApp
//
//  Created by Paul Matar on 08.03.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let username = "User"
    private let password = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTF.delegate = self
        passwordTF.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let tabBarController = segue.destination as? UITabBarController {
            
            guard let viewControllers = tabBarController.viewControllers else { return }
            
            for viewController in viewControllers {
                
                if let welcomeVC = viewController as? WelcomeViewController {
                    welcomeVC.userName = "Paul"
                } else if let navigationVC = viewController as? UINavigationController {
                    guard let bioVC = navigationVC.topViewController as? BioViewController else { return }
                    bioVC.title = "Paul Matar"
                }
            }
        }
    }
        
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func loginButtonPressed() {
        if usernameTF.text == username && passwordTF.text == password {
            performSegue(withIdentifier: "loginSegue", sender: nil)
        } else {
            showAlert(title: "Invalid login or password",
                      message: "Please, enter correct login and password",
                      textField: passwordTF)
        }
    }
    
    @IBAction func remindHints(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops!", message: "Your name is \(username) 😉")
        : showAlert(title: "Oops!", message: "Your password is \(password) 😉")
    }
    
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case usernameTF:
            passwordTF.becomeFirstResponder()
        default:
            loginButtonPressed()
        }
        return true
    }
}
