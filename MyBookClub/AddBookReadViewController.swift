//
//  AddBookReadViewController.swift
//  BookClub
//
//  Created by Cynthia Whitlatch on 6/15/16.
//  Copyright © 2016 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class AddBookReadViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {
    
    var dictionaryOfBooksRead = [String:String]()
    
    let buttonBorder = UIColor.white.cgColor
    let buttonColor = UIColor(red: 40/255, green: 141/255, blue: 255/255, alpha: 0.5).cgColor

    @IBOutlet weak var saveBooksRead: UIButton!
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var authorOfBook: UITextField?
    @IBOutlet weak var titleOfBook: UITextField?
    
    @IBAction func selectBookCover(_ sender: AnyObject) {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        myPickerController.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(myPickerController, animated: true, completion: nil)

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        bookImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.authorOfBook?.delegate = self
        self.titleOfBook?.delegate = self

        customLabels()
    }
    
    @IBAction func saveBook(_ sender: UIButton) {
        
        if titleOfBook?.text == "" || authorOfBook?.text == "" {
            let alertView = UIAlertController(title: "WARNING",
                                              message: "You must enter the Book Title and the Author's name" as String, preferredStyle:.alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertView.addAction(okAction)
            
            self.present(alertView, animated: true, completion: nil)
        } else {
        
            if let bookReadTitleText = titleOfBook?.text, let authorNameText = authorOfBook?.text {
            dictionaryOfBooksRead.updateValue(bookReadTitleText, forKey: authorNameText)
            }
            self.dismiss(animated: true, completion: {});

        }
        print(dictionaryOfBooksRead)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addbook")
        {
            
            let add = segue.destination as! MyHomeViewController
            add.bookTitle = titleOfBook?.text
            add.author = authorOfBook?.text
            add.image = bookImage.image
        }
    }
    
    func customLabels() {
        titleOfBook?.layer.borderColor = buttonBorder
        titleOfBook?.layer.backgroundColor  = buttonColor
        titleOfBook?.layer.borderWidth = 1
        titleOfBook?.layer.cornerRadius = 10
        
        authorOfBook?.layer.borderColor = buttonBorder
        authorOfBook?.layer.backgroundColor  = buttonColor
        authorOfBook?.layer.borderWidth = 1
        authorOfBook?.layer.cornerRadius = 10
     
        saveBooksRead.layer.borderColor = buttonBorder
        saveBooksRead.layer.backgroundColor  = buttonColor
        saveBooksRead.layer.borderWidth = 1
        saveBooksRead.layer.cornerRadius = 10
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
