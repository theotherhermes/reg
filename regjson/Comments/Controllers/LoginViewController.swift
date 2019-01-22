//
//  ViewController.swift
//  regjson
//
//  Created by Rinat Luhmanov on 22/01/2019.
//  Copyright © 2019 Rinat Luhmanov. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    func errorWarningLabel(withText text: String) {
        errorLabel.text = text
        
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: { [weak self] in
            self?.errorLabel.alpha = 1
        }) { [weak self] complete in
            self?.errorLabel.alpha = 0
        }
        }
    
    @IBAction func loginButton(_ sender: UIButton) {
        guard let email = emailField.text, let password = passwordField.text, email != "", password != "" else {
            errorWarningLabel(withText: "Inf is incorrect")
            return
        }
        Auth.auth().signIn(withEmail: email, link: password) { [weak self] (user, error) in
            if error != nil {
                self?.errorWarningLabel(withText: "Error ocoured")
                return
            }
            
            if user != nil {
                self?.performSegue(withIdentifier: "loginSegue", sender: nil)
                return
            }
            self?.errorWarningLabel(withText: "No such user")
        }
    }
    

    
    @IBAction func createButton(_ sender: UIButton) {
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
    }


}

