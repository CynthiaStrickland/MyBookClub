//
//  LoginViewController.swift
//  Book Club
//
//  Created by Cynthia Whitlatch on 12/31/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//


import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    let buttonBorder = UIColor.white.cgColor
    let buttonColor = UIColor(red: 40/255, green: 141/255, blue: 255/255, alpha: 0.5).cgColor

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customButtons()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        customButtons()
        
    }
    
    @IBAction func loginButtonPressed(_ sender: AnyObject) {
        let userEmail = self.userEmailTextField.text!
        let userPassword = self.userPasswordTextField.text!
        
        if userEmail != "" || userPassword != "" {

        } else {
            
            let alertView = UIAlertController(title: "Login Problem",
                                              message: "You must enter an email and password" as String,preferredStyle:.alert)
            let okAction = UIAlertAction(title: "Try Again!", style: .default, handler: nil)
            alertView.addAction(okAction)
            self.present(alertView, animated: true, completion: nil)
        }
    }
    
    @IBAction func RegisterButtonPressed(_ sender: AnyObject) {
        let userEmail = self.userEmailTextField.text!
        let userPassword = self.userPasswordTextField.text!
        
        if userEmail != "" || userPassword != "" {

        } else {
            
            let alertView = UIAlertController(title: "Registration Problem",
                                              message: "You must enter an email and password" as String, preferredStyle:.alert)
            let okAction = UIAlertAction(title: "Try Again!", style: .default, handler: nil)
            alertView.addAction(okAction)
            self.present(alertView, animated: true, completion: nil)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userEmailTextField.resignFirstResponder()
        userPasswordTextField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func customButtons() {
        userEmailTextField.layer.borderColor = buttonBorder
        userEmailTextField.layer.backgroundColor  = buttonColor
        userEmailTextField.layer.borderWidth = 1
        userEmailTextField.layer.cornerRadius = 10
        
        userPasswordTextField.layer.borderColor = buttonBorder
        userPasswordTextField.layer.backgroundColor  = buttonColor
        userPasswordTextField.layer.borderWidth = 1
        userPasswordTextField.layer.cornerRadius = 10
        
        loginButton.layer.borderColor = buttonBorder
        loginButton.layer.backgroundColor  = buttonColor
        loginButton.layer.borderWidth = 1
        loginButton.layer.cornerRadius = 10
        
        registerButton.layer.borderColor = buttonBorder
        registerButton.layer.backgroundColor  = buttonColor
        registerButton.layer.borderWidth = 1
        registerButton.layer.cornerRadius = 10
    }
}

