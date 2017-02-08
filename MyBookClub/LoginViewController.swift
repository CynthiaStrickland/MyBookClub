//
//  LoginViewController.swift
//  Book Club
//
//  Created by Cynthia Whitlatch on 12/31/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//


import UIKit
import LBTAComponents

import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseDatabase

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
        loginViewControllerHandlers()
    }
    
    @IBAction func loginButtonPressed(_ sender: AnyObject) {
        handleLogin()
    }
    
    fileprivate func registerUserIntoDatabaseWithUID(_ uid: String, values: [String: AnyObject]) {
        let ref = FIRDatabase.database().reference(fromURL: "https://my-book-club-d479c.firebaseio.com/")
        let usersReference = ref.child("users").child(uid)
        usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
            
            if err != nil {
                print(err!)
                return
            }
            
            self.dismiss(animated: true, completion: nil)
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userEmailTextField.resignFirstResponder()
        userPasswordTextField.resignFirstResponder()
        return true
    }
    
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "me")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectProfileImageView)))
        imageView.isUserInteractionEnabled = true
        
        return imageView
    }()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func customButtons() {
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

