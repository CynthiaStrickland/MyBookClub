//
//  MyHomeViewController.swift
//  BookClub
//
//  Created by Cynthia Whitlatch on 5/27/16.
//  Copyright © 2016 Cynthia Whitlatch. All rights reserved.
//
import CoreFoundation
import UIKit

class MyHomeViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var titleOfBook : String?
    var authorOfBook : String?
    var bookImage : UIImage?
    var base64String : NSString = ""
    var memberSince : String?
    var memberAboutMe: String?
    
    var booksRead = [Books]()
    var users = [User]()


    let buttonBorder = UIColor.white.cgColor
    let buttonColor = UIColor(red: 40/255, green: 141/255, blue: 255/255, alpha: 0.5).cgColor

    @IBOutlet weak var profilePhotoImageView: UIImageView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var share: UIButton!
    @IBOutlet weak var logout: UIButton!
    
    @IBOutlet weak var saveMemberName: UIButton!
    @IBOutlet weak var memberName: UITextField!
    @IBOutlet weak var booksReadTableview: UITableView!
    @IBOutlet weak var profileImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        customButtons()
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
            //MARK :   PROFILE PICTURE SELECTION
    @IBAction func selectProfilePhoto(_ sender: AnyObject) {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.allowsEditing = true
        myPickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(myPickerController, animated: true, completion: nil)
    }

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImageFromPicker : UIImage?
        
        if let editedImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
                selectedImageFromPicker = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
                selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            profilePhotoImageView.image = selectedImage
        
        //  ******* Circular Image *******
        self.profilePhotoImageView.layer.cornerRadius = self.profilePhotoImageView.frame.width / 2.0
        self.profilePhotoImageView.clipsToBounds = true
        
        //  ******* BORDER COLOR ********
        self.profilePhotoImageView.layer.borderWidth = 2.0
        self.profilePhotoImageView.layer.borderColor = UIColor.white.cgColor

        self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func saveMemberName(_ sender: UIButton) {
        // TODO:   SAVE MEMBER NAME
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return booksRead.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MyHomeTableviewCell = tableView.dequeueReusableCell(withIdentifier: "booksread", for: indexPath) as! MyHomeTableviewCell
        
        let myBooksRead = booksRead[indexPath.row]
        
        cell.textLabel?.text =  myBooksRead.titleOfBook
        cell.detailTextLabel?.text =  myBooksRead.authorOfBook
        cell.imageView?.image = myBooksRead.bookImage
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryboard : UIStoryboard = UIStoryboard(name: "MyHomeViewController", bundle: nil)
        let homeViewController : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "UserBookNotes")
        self.present(homeViewController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            
            self.booksRead.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        
    }

    @IBAction func shareButtonPressed(_ sender: UIButton) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func customButtons() {
        
    logout.layer.borderColor = buttonBorder
    logout.layer.backgroundColor  = buttonColor
    logout.layer.borderWidth = 1
    logout.layer.cornerRadius = 10
    
    share.layer.borderColor = buttonBorder
    share.layer.backgroundColor  = buttonColor
    share.layer.borderWidth = 1
    share.layer.cornerRadius = 10
        
    addButton.layer.borderColor = buttonBorder
    addButton.layer.backgroundColor  = buttonColor
    addButton.layer.borderWidth = 1
    addButton.layer.cornerRadius = 10

    saveMemberName.layer.borderColor = buttonBorder
    saveMemberName.layer.backgroundColor  = buttonColor
    saveMemberName.layer.borderWidth = 1
    saveMemberName.layer.cornerRadius = 10
    }
}






