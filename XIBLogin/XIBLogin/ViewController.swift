//
//  ViewController.swift
//  XIBLogin
//
//  Created by Anusha K G on 12/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var newView: LoginView!
    override func viewDidLoad() {
        super.viewDidLoad()
         
    }
    @IBAction func loginButtonTapped(_ sender: UIButton) {
            newView.Login(sender)
        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}




