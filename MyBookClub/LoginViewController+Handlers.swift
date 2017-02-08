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
    
    func loginViewControllerHandlers() {
        handleRegister()
        handleLogin()
        handleSelectProfileImageView
    }
    
    func handleRegister() {
        guard let email = userEmailTextField.text, let password = userPasswordTextField.text else {
            return
        }
        
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user: FIRUser?, error) in
            
            if error != nil {
                return
            }
            
            guard let uid = user?.uid else {
                return
            }
            
            let imageName = UUID().uuidString
            let storageRef = FIRStorage.storage().reference().child("profile_images").child("\(imageName).png")
            
            if let uploadData = UIImagePNGRepresentation(self.profileImageView.image!) {
                storageRef.put(uploadData, metadata: nil, completion: { (metadata, error) in
                    
                    if error != nil {
                        print(error!)
                        return
                    }
                    
                    if let profileImageUrl = metadata?.downloadURL()?.absoluteString {
                        let values = ["email": email, "password": password, "profileImageUrl": profileImageUrl]
                        self.registerUserIntoDatabaseWithUID(uid, values: values as [String : AnyObject])
                    }
                })
            }
        })
    }
    
    func handleLogin() {
        guard let email = userEmailTextField.text, let password = userPasswordTextField.text else {
            print("Form is not valid")
            return
        }
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                return
            }
            self.dismiss(animated: true, completion: nil)
        })
    }
    
    func handleSelectProfileImageView() {
        let picker = UIImagePickerController()
        
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
    }
    
}
