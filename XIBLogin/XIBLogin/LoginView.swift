//
//  LoginView.swift
//  XIBLogin
//
//  Created by Anusha K G on 13/09/23.
//

import UIKit

class LoginView: UIView {

   
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotButton: UIButton!
    
    var iconClick = false
    let imageicon = UIImageView()
    
    weak var delegate: LoginDelegate?
   
    override init(frame: CGRect) {
       super.init(frame: frame)
       commonInit()
   }
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
       commonInit()
   }
    
    private func commonInit() {
        if let nibView = Bundle.main.loadNibNamed("LoginView", owner: self, options: nil)?.first as? UIView {
            nibView.frame = bounds
            addSubview(nibView)
            
            nibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            setupPasswordVisibilityToggle()
        }
        
        loginButton.isEnabled = false
        usernameTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .allEditingEvents)

       }
      
       @IBAction func Login(_ sender: Any) {
           if let username = usernameTextField.text, let password = passwordTextField.text {
                      print("Username: \(username)")
                      print("Password: \(password)")
                  }
       }
       
       @IBAction func forgetPasswordPressed(_ sender: Any) {
           delegate?.didPressForgotPassword()
       }
       
       @objc private func textFieldDidChange(_ textField: UITextField) {
           if let userNameText = usernameTextField.text, let passwordText = passwordTextField.text {
               loginButton.isEnabled = !userNameText.isEmpty && !passwordText.isEmpty
           } else {
           loginButton.isEnabled = false
           }
       }
   }
   protocol LoginDelegate: AnyObject {
       func didPressForgotPassword()
   }


extension LoginView {
    func setupPasswordVisibilityToggle() {
        iconClick = false
        let imageIcon = UIImageView(image: UIImage(named: "invisible"))
        
        let contentView = UIView()
        contentView.addSubview(imageIcon)
        
        contentView.frame = CGRect(x: 0, y: 0, width: imageIcon.frame.size.width, height: imageIcon.frame.size.height)
        
        imageIcon.frame = CGRect(x: -10, y: 0, width: imageIcon.frame.size.width, height: imageIcon.frame.size.height)
        
        passwordTextField.rightView = contentView
        passwordTextField.rightViewMode = .always
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        
        imageIcon.isUserInteractionEnabled = true
        imageIcon.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc func imageTapped(_ tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        if iconClick {
            iconClick = false
            tappedImage.image = UIImage(named: "visible")
            passwordTextField.isSecureTextEntry = false
        } else {
            iconClick = true
            tappedImage.image = UIImage(named: "invisible")
            passwordTextField.isSecureTextEntry = true
        }
    }
}

        
    
    

