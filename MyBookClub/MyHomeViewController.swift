//
//  MyHomeViewController.swift
//  BookClub
//
//  Created by Cynthia Whitlatch on 5/27/16.
//  Copyright © 2016 Cynthia Whitlatch. All rights reserved.
//
import CoreFoundation
import UIKit
import IQKeyboardManagerSwift
import FirebaseAuth



class MyHomeViewController: UICollectionViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var titleOfBook : String?
    var authorOfBook : String?
    var bookImage : UIImage?
    var base64String : NSString = ""
    var memberSince : String?
    var memberAboutMe: String?
    
    var imagePicker = UIImagePickerController()
    var imagePicked = 0
    
    var booksRead = [Books]()
    var members = [Member]()

    var bookauthorDictionary = [String:String]()

    let buttonBorder = UIColor.white.cgColor
    let buttonColor = UIColor(red: 40/255, green: 141/255, blue: 255/255, alpha: 0.5).cgColor

    //MARK:  OUTLETS
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var share: UIButton!
    @IBOutlet weak var logout: UIButton!
    
    @IBOutlet weak var saveMemberName: UIButton!
    @IBOutlet weak var memberName: UITextField!
    @IBOutlet weak var booksReadTableview: UITableView!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var addBookReadImageView: UIImageView!
    
    @IBOutlet weak var addTitleOfBookRead: UITextField!
    @IBOutlet weak var addAuthorOfBookRead: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        booksReadTableview.allowsSelectionDuringEditing = true
        booksReadTableview.estimatedRowHeight = 67.0
        booksReadTableview.rowHeight = UITableViewAutomaticDimension
        automaticallyAdjustsScrollViewInsets = true
        navigationItem.rightBarButtonItem = editButtonItem
        
        customButtons()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let userDefaults = UserDefaults.standard
        memberName.text = userDefaults.object(forKey: "MyMemberName") as? String
    }
    
    //MARK:   PROFILE PICTURE SELECTION
    @IBAction func selectProfilePhoto(_ sender: AnyObject) {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.allowsEditing = true
        myPickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(myPickerController, animated: true, completion: nil)
    }

    
    @IBAction func chooseImage(sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            print("chooseImage Button capture ")
            
            imagePicked = sender.tag
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
            let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
            
            if imagePicked == 1 {
                profileImage.image = pickedImage
            } else if imagePicked == 0 {
                addBookReadImageView.image = pickedImage
            }
        
        if let selectedImage = pickedImage {
            profilePhotoImageView.image = selectedImage
            
            //  ******* Circular Image *******
            self.profilePhotoImageView.layer.cornerRadius = self.profilePhotoImageView.frame.width / 2.0
            self.profilePhotoImageView.clipsToBounds = true
            
            //  ******* BORDER COLOR ********
            self.profilePhotoImageView.layer.borderWidth = 2.0
            self.profilePhotoImageView.layer.borderColor = UIColor.white.cgColor
            
            self.dismiss(animated: true, completion: nil)
        } else {
            
        }
    }
    
    @IBAction func selectAddBookImage(_ sender: AnyObject) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(pickerController, animated: true, completion: nil)

    }
    
    func addImagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        addBookReadImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func saveMemberName(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(memberName.text, forKey: "MyMemberName")
        userDefaults.synchronize()
    }
    //MARK: CUSTOM COLLECTION VIEW
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return booksRead.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : UITableViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "booksread", for: indexPath)
        
        let myBooksRead = booksRead[indexPath.row]
        
        cell.textLabel?.text =  myBooksRead.titleOfBook
        cell.detailTextLabel?.text =  myBooksRead.authorOfBook
        cell.imageView?.image = myBooksRead.bookImage
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let mainStoryboard : UIStoryboard = UIStoryboard(name: "MyHomeViewController", bundle: nil)
//        let homeViewController : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "UserBookNotes")
//        self.present(homeViewController, animated: true, completion: nil)
//    }
//    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        
//        guard case(.delete) = editingStyle else { return }
//        
//        if editingStyle == .delete {
//            print("Deleted")
//            
//            self.booksRead.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//        }
//    }

    //MARK: LOGOUT
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        try! FIRAuth.auth()?.signOut()
        dismiss(animated: true, completion: nil)

    }
    
    @IBAction func saveBookRead(_ sender: UIButton) {
 //       addTitleOfBookRead
//        addAuthorOfBookRead
        //bookauthorDictionary
    
    }

    @IBAction func shareButtonPressed(_ sender: UIButton) {
        let infoToShare = titleOfBook
        let vc = UIActivityViewController(activityItems: [infoToShare as Any], applicationActivities: nil)
        vc.popoverPresentationController?.sourceView = self.view
        vc.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
        self.present(vc, animated: true, completion: nil)
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    //MARK: CUSTOM BUTTONS
    
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







