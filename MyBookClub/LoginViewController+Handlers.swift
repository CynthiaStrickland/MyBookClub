//
//  LoginViewController+Handlers.swift
//  MyBookClub
//
//  Created by Cynthia Whitlatch on 2/7/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseDatabase

extension LoginViewController {

//    if loginRegisterControl.selectedSegmentIndex == 0 {
//    FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
//    
//    if user != nil {
//    self.performSegue(withIdentifier: "mainviewcontroller", sender: self)
//    
//    } else {
//    if let myError = error?.localizedDescription {
//    print(myError)
//    } else {
//    let alert = UIAlertController(title: "Error", message: "Please enter a valid email address and/or password", preferredStyle: .actionSheet)
//    self.present(alert, animated: true, completion:nil)
//    alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
//    // perhaps use action.title here
//    })
//    }
//    }
//    })
//    } else {
//    FIRAuth.auth()?.createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
//    if user != nil {
//    self.performSegue(withIdentifier: "mainviewcontroller", sender: self)
//    } else {
//    
    func handleLogin() {
        
        let email = userEmailTextField.text
        let password = userPasswordTextField.text
        
        if loginRegisterControl.selectedSegmentIndex == 0 {
            emailPasswordValidation()
    
            FIRAuth.auth()?.signIn(withEmail: email!, password: password!, completion: { (user, error) in
                    
                if error != nil {
                    return
                }
                self.dismiss(animated: true, completion: nil)
            })
            
        } else {
            emailPasswordValidation()
    
            FIRAuth.auth()?.createUser(withEmail: email!, password: password!, completion: { (user: FIRUser?, error) in
    
                if error != nil {
                    
                return
                }
            })
        }
    }
    
    func emailPasswordValidation() {
        if userEmailTextField.text == "" || userPasswordTextField.text == "" {

        let alertView = UIAlertController(title: "Error",
                                          message: "Email & Password Required" as String, preferredStyle:.alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertView.addAction(okAction)
        self.present(alertView, animated: true, completion: nil)
        return
        }
    }





//            guard let uid = user?.uid else {
//                return
//            }

//            let imageName = UUID().uuidString
//            let storageRef = FIRStorage.storage().reference().child("profile_images").child("\(imageName).png")
//
//            if let uploadData = UIImagePNGRepresentation(self.profileImageView.image!) {
//                storageRef.put(uploadData, metadata: nil, completion: { (metadata, error) in
//
//                    if error != nil {
//                        print(error!)
//                        return
//                    }
//
//                    if let profileImageUrl = metadata?.downloadURL()?.absoluteString {
//                        let values = ["email": email, "password": password, "profileImageUrl": profileImageUrl]
//                        self.registerUserIntoDatabaseWithUID(uid, values: values as [String : AnyObject])
//                    }
//                })
//            }
