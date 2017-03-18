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

    func handleLogin() {
        if userEmailTextField != nil && userPasswordTextField != nil {
            
            if loginRegisterControl.selectedSegmentIndex == 0 {
                FIRAuth.auth()?.signIn(withEmail: userEmailTextField.text!, password: userPasswordTextField.text!, completion: { (user, error) in
                    
                    if user != nil {
                        print("SUCCESS REGISTERING")
                        self.performSegue(withIdentifier: "tab", sender: self)

                        
                    } else {
                        if let myError = error?.localizedDescription {
                            print(myError)
                        } else {
                            let alert = UIAlertController(title: "Error", message: "Please enter a valid email address and/or password", preferredStyle: .actionSheet)
                            self.present(alert, animated: true, completion:nil)
                            alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
                            })
                        }
                    }
                })
            } else {
                FIRAuth.auth()?.createUser(withEmail: userEmailTextField.text!, password: userPasswordTextField.text!, completion: { (user, error) in
                    if user != nil {
                        print("SUCCESS REGISTERING")
                    } else {
                        print("TRY AGAIN")
                    }
                })
            }
        }
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
