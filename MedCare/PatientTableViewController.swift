//
//  PatientTableViewController.swift
//  MedCare
//
//  Created by Priscilla Ikhena on 15/04/2019.
//  Copyright © 2019 Priscilla Ikhena. All rights reserved.
//

import UIKit
import Firebase

class PatientTableViewController: UITableViewController {
    
    
    //MARK: Properties
    var patientsArray : [Patient] = [Patient]()
    var alertsArrayData = [Alert]() //mimicks the data we would get from the raspberry
   
    //var updateStatus = ""

    
    
    @IBOutlet var patientTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newAlert = Alert()
        
        newAlert.patientName = "Emily"
        newAlert.alert = true
        alertsArrayData.append(newAlert)
        

        // Load our patient data.
        retrievePatients()
        
    }
    //TO DO: add if statement here to only show alertsButton if "Alert is No".
    
    @IBAction func alertsButtonPressed(_ sender: Any) {
        

        //let patientUpdate = retrievePatientUpdates()
        
      //  print("Here's what patient Update is returning")
       // print(patientUpdate)
        
        let updatesDB = Database.database().reference().child("Update")
        updatesDB.observe(.childAdded) { (snapshot) in
            //
            //            //returns a snapshot of the database.
            //
            let snapshotValue = snapshot.value as! String //converting data gotten to a string
            //print(snapshotValue)
            let text = snapshotValue
           
            
            //print(self.updateStatus)
            print("Here's updateStatusInside")
            print(text)
            let phoneURL = NSURL(string: ("tel://" + "+33758389028"))
            
        if text == "bad" {

                    print("I'm in IF")

                    let alert = UIAlertController(title: "Patient Missed a Pill today", message: "", preferredStyle: .alert)


                    let actionCall = UIAlertAction(title: "Call Patient", style: .default) { (action) in
                        UIApplication.shared.open(phoneURL! as URL, options: [:], completionHandler: nil)

                        //what will happen once the user clicks the add item button on our UI alert.
                    }
                    let actionCancel = UIAlertAction(title: "Cancel", style: .default) { (action) in


                    }
                    alert.addAction(actionCall)
                    alert.addAction(actionCancel)

                   self.present(alert, animated: true, completion: nil)
                }

            else {
                print("I'm in ELSE")

                let alert = UIAlertController(title: "No Alerts, Patient is all set! :)", message: "", preferredStyle: .alert)
                let actionCancel = UIAlertAction(title: "Cancel", style: .default) { (action) in
                }
                alert.addAction(actionCancel)
                self.present(alert, animated: true, completion: nil)
            }
            
        }
        

    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return patientsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        
        
        let cellIdentifier = "PatientListTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PatientTableViewCell else {
            fatalError("The dequeued cell is not an instance of PatientTableViewCell.")
        }
        
        //fetches the appropraite patient for the data source layout
        
     
        let patient = patientsArray[indexPath.row]
        cell.nameLabel.text = patient.patientName
        
        
        

        return cell
    }
    
    
//    func retrievePatientUpdates() -> String {
//
////        var updateStatus = ""
////       let updatesDB = Database.database().reference().child("Update")
////    updatesDB.observe(.childAdded) { (snapshot) in
////            //
////            //            //returns a snapshot of the database.
////            //
////            let snapshotValue = snapshot.value as! String //converting data gotten to a string
////            //print(snapshotValue)
////            let text = snapshotValue
////
////
////           // print(text)
////        updateStatus = text
////         //print(self.updateStatus)
////        print("Here's updateStatusInside")
////        print(updateStatus)
////
////        }
//        print("HEre's updateStatusOutside")
//        print(updateStatus)
//
//        return updateStatus
//    }

    
    //MARK: Private Methods
    
    func retrievePatients() {
        
            
               let patientsDB = Database.database().reference().child("Patients")
        //
        //        //referencing the database we're putting data into in "add new". Making sure we're sending and receiving from the same database.
        //
        //        //when new Patient has been added, this grabs them
        //
                patientsDB.observe(.childAdded) { (snapshot) in
        //
        //            //returns a snapshot of the database.
        //
                    let snapshotValue = snapshot.value as! Dictionary<String,String>//converting data gotten to a dicitionary
                    
                     let text = snapshotValue["Patient Information"]!
                     var patientInfo : String = ""
                     patientInfo = text
                    
                    
        
                    let patientInfoArray = patientInfo.components(separatedBy: ",") //changing our received data into a form that can be taken in by an array.
        
                    let newPatient = Patient()
                  
                    
                   newPatient.patientName = patientInfoArray[0]
                   newPatient.patientAge = patientInfoArray[1]
                   newPatient.pill = patientInfoArray[2]
                   newPatient.cadence = patientInfoArray[3]
                   newPatient.patientLocation = patientInfoArray[4]
                    
              
                    
                   
        
                   self.patientsArray.append(newPatient)//array of all patients. It will display each patient from here each time.
                   self.patientTableView.reloadData()
                    
                   // print(self.alertsArray)
        
              }
        
    }

}
