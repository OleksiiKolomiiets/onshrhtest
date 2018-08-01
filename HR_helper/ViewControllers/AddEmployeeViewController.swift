//
//  AddEmployeeViewController.swift
//  HR_helper
//
//  Created by Oleksii Kolomiiets on 7/30/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit
import Photos

class AddEmployeeViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var imageIcon: UIImageView!
    @IBOutlet weak var containerForAvatarImageView: UIView!
    @IBOutlet weak var birthdayDatePicker: UIDatePicker!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var positionTextField: UITextField!
    
    var employeeIdentifier: Int?
    var birthdayDate: Date?
    var employeeName: String?
    var employeePosition: String?
    
    @IBAction func dateValueChanged(_ sender: UIDatePicker) {
        birthdayDate = sender.date
    }
   
    @IBAction func startToWrite(_ sender: UITextField) {
        sender.backgroundColor = .white
        sender.placeholder = ""
    }
    
    @IBAction func writeText(_ sender: UITextField) {        
        let text = sender.text
        
        if sender == nameTextField {
            employeeName = text
        } else if sender == positionTextField {
            employeePosition = text
        }
    }
    
    @IBAction func addingNewEmployeeIsDone(_ sender: UIBarButtonItem) {
        let birthdayDate = self.birthdayDate ?? birthdayDatePicker.date
        var avatar: AvatarManager?
        if let image = imageIcon.image {
            avatar = AvatarManager(with: image)
        }
        
        var isTextFeildIsFull = true
        if employeeName == nil || (employeeName?.isEmpty)! {
            nameTextField.placeholder = "Please, put employee's name."
            nameTextField.backgroundColor = #colorLiteral(red: 1, green: 0.8977971094, blue: 0.8898261505, alpha: 1)
            isTextFeildIsFull = false
        }
        if employeePosition == nil || (employeePosition?.isEmpty)! {
            positionTextField.placeholder = "Please, put employee's position."
            positionTextField.backgroundColor = #colorLiteral(red: 1, green: 0.8977971094, blue: 0.8898261505, alpha: 1)
            isTextFeildIsFull = false
        }
        
        if isTextFeildIsFull {
            let newEmployee = EmployeeEntity(name: employeeName!,
                                             position: employeePosition!,
                                             birthDay: birthdayDate,
                                             avatar: avatar)
            
            fakeData.append(newEmployee)
            
            self.navigationController?.popToRootViewController(animated: true)
        } else {
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func changeImageButtonTapped(_: UIButton) {
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black]
        
        let photos = PHPhotoLibrary.authorizationStatus()
        if photos == .notDetermined {
            PHPhotoLibrary.requestAuthorization({ status in
                if status == .authorized {
                    self.presentImagePicker()
                } else {
                    self.showAlert(title: "Warning", message: TypeError.deniedPermission.localizedDescription)
                }
            })
        } else if photos == .authorized {
            presentImagePicker()
        }
    }
    
    private func presentImagePicker() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
    }
    
}

extension AddEmployeeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            showAlert(title: "Error", message: TypeError.imageInvalid.localizedDescription)
            return
        }
        self.containerForAvatarImageView.backgroundColor = .clear
        self.imageIcon.image = image
    }
    
    func imagePickerControllerDidCancel(_: UIImagePickerController) {
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        dismiss(animated: true, completion: nil)
    }
}
