//
//  ViewController.swift
//  regjson
//
//  Created by Rinat Luhmanov on 22/01/2019.
//  Copyright © 2019 Rinat Luhmanov. All rights reserved.
//

import UIKit
import Firebase

class CreateViewController: UIViewController {
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    
    

    @IBAction func createButton(_ sender: Any) {
        guard let email = emailField.text, let password = passwordField.text, email != "", password != "" else {
            return
    }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (user, error) in
            if error == nil {
                if user != nil {
                    self?.performSegue(withIdentifier: "createSegie", sender: nil)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
