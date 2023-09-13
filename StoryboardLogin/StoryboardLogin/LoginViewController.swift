//
//  LoginViewController.swift
//  StoryboardLogin
//
//  Created by Anusha K G on 12/09/23.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var usernametextField: UITextField!
    
    @IBOutlet weak var passwordtextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var forgotButton: UIButton!
    
    var iconClick = false
    let imageicon = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
         
        imageicon.image = UIImage(named: "invisible")
        
        let contentview = UIView()
        contentview.addSubview(imageicon)
        
        contentview.frame = CGRect(x: 0, y: 0, width: UIImage(named: "invisible")!.size.width, height: UIImage(named: "invisible")!.size.height)
          
        imageicon.frame = CGRect(x: -10, y: 0, width: UIImage(named: "invisible")!.size.width, height: UIImage(named: "invisible")!.size.height)
        
        passwordtextField.rightView = contentview
        passwordtextField.rightViewMode = .always
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
         
        imageicon.isUserInteractionEnabled = true
        imageicon.addGestureRecognizer(tapGestureRecognizer)
            }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        if iconClick
        {
            iconClick=false
            tappedImage.image = UIImage(named: "visible")
            passwordtextField.isSecureTextEntry = false
        }
        else
        {
            iconClick=true
            tappedImage.image = UIImage(named: "invisible")
            passwordtextField.isSecureTextEntry = true
        }
    }
    
    
    private func setUI() {
        loginButton.isEnabled = false
        loginButton.alpha = 0.8
        
        usernametextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordtextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @IBAction private func logintapped(_sender: UIButton) {
        let username = usernametextField.text ?? ""
        let password = passwordtextField.text ?? ""
        print("\(username) and \(password)")
    }
    
    @objc  func textFieldDidChange(_ textField: UITextField) {
        let usernameEmpty = usernametextField.text?.isEmpty ?? true
        let passwordEmpty = passwordtextField.text?.isEmpty ?? true
        loginButton.isEnabled = !(usernameEmpty || passwordEmpty)
        loginButton.alpha = loginButton.isEnabled ? 1.0 : 0.8
    }
}
