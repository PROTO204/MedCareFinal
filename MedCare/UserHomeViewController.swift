//
//  UserHomeViewController.swift
//  MedCare
//
//  Created by Priscilla Ikhena on 03/04/2019.
//  Copyright © 2019 Priscilla Ikhena. All rights reserved.
//

import UIKit
import Firebase


class UserHomeViewController: UIViewController {
    
    
    //pre-linked IBOutlets
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func logOutPressed(_ sender: Any) {
            
            //TODO: Log out the user and send them back to WelcomeViewController
            do {
                try Auth.auth().signOut()
                navigationController?.popToRootViewController(animated: true)
                
            }
            catch {
                print("There was a problem signing out.")
            }
            
        }
    }
    


