//
//  CreateBookClub.swift
//  BookClub
//
//  Created by Cynthia Whitlatch on 6/15/16.
//  Copyright © 2016 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class CreateBookClub: UIViewController, UITextViewDelegate, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    var bookClubInfo = [Books]()
    
    var totalLines:CGFloat = 15
    var maxHeight:CGFloat = 0
    
    let buttonBorder = UIColor.white.cgColor
    let buttonColor = UIColor(red: 40/255, green: 141/255, blue: 255/255, alpha: 0.5).cgColor

    @IBOutlet weak var bookClubImage: UIImageView!
    @IBOutlet weak var nameOfBookClub: UITextField!
    @IBOutlet weak var aboutBookClub: UITextView!
    @IBOutlet weak var createBookClub: UIButton!
    @IBOutlet weak var clubDateTimeLocation: UITextField!

    @IBAction func addPhotoPressed(_ sender: AnyObject) {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.allowsEditing = true
        myPickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(myPickerController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customButtons()
        customTextFieldSize()
        

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        bookClubImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func customTextFieldSize() {
        maxHeight = aboutBookClub.font!.lineHeight * totalLines
        aboutBookClub.sizeThatFits(CGSize(width: aboutBookClub.frame.size.width,
            height: maxHeight))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        aboutBookClub.resignFirstResponder()
        nameOfBookClub.resignFirstResponder()
        return true
    }
    
    func customButtons() {
        createBookClub.layer.borderColor = buttonBorder
        createBookClub.layer.backgroundColor  = buttonColor
        createBookClub.layer.borderWidth = 1
        createBookClub.layer.cornerRadius = 10
        
        aboutBookClub.layer.borderColor = buttonBorder
        aboutBookClub.layer.backgroundColor  = buttonColor
        aboutBookClub.layer.borderWidth = 1
        aboutBookClub.layer.cornerRadius = 10
        
        nameOfBookClub.layer.borderColor = buttonBorder
        nameOfBookClub.layer.backgroundColor  = buttonColor
        nameOfBookClub.layer.borderWidth = 1
        nameOfBookClub.layer.cornerRadius = 10
        
    }

}
