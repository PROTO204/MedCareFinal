//
//  AddNewPatient.swift
//  MedCare
//
//  Created by Priscilla Ikhena on 07/04/2019.
//  Copyright © 2019 Priscilla Ikhena. All rights reserved.
//

import UIKit
import Firebase

class AddNewPatient: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var locationField: UITextField!
    @IBOutlet var cadenceField: UITextField!
    @IBOutlet var pillField: UITextField!
    @IBOutlet var ageField: UITextField!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var sendButton: UIButton!
    
    var patientArray : [Patient] = [Patient]() //creating a brand new array of patients.
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: Setting ourselves as delegates for these fields here.
        
        locationField.delegate = self
        cadenceField.delegate = self
        pillField.delegate = self
        ageField.delegate = self
        nameField.delegate = self
        
        
    }
    
    
    //MARK: - Send information to Firebase.
    
    @IBAction func sendPressed(_ sender: Any) {
        
    locationField.isEnabled = false
    cadenceField.isEnabled = false
    pillField.isEnabled = false
    ageField.isEnabled = false
    nameField.isEnabled = false
    sendButton.isEnabled = false
        
    let patientsDB = Database.database().reference().child("Patients") //creating a new child database.
        
        var patientInformationString = ""
        
        patientInformationString = nameField.text! + "," + ageField.text! + "," + pillField.text! + "," + cadenceField.text! + "," + locationField.text!
        
        
        
    
        let patientDictionary = ["Caretaker" : Auth.auth().currentUser?.email!, "Patient Information" : patientInformationString ]
        
      
        
        patientsDB.childByAutoId().setValue(patientDictionary) {
            
            (error, reference) in
            
            if error != nil {
                print(error!)
                
            }
            
            else {
                print("patient saved successfully")
                
                self.sendButton.isEnabled = true
                self.nameField.isEnabled = true
                self.ageField.isEnabled = true
                self.pillField.isEnabled = true
                self.cadenceField.isEnabled = true
                self.locationField.isEnabled = true
                
                //clear out the fields
                self.nameField.text = ""
                self.ageField.text = ""
                self.pillField.text = ""
                self.cadenceField.text = ""
                self.locationField.text = ""
                
            }
            
        }//saving out Patients dictionary, under our patient's database.
        
    }
    
    
}

