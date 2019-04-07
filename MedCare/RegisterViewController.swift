//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase


class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        

        
        //TODO: Set up a new user on our Firbase database
        //this is the code for authentication
        //creates a user in the firebase 
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            if error != nil {
                print("there was an error")
            }
            
            else {
                //success
                print("registeration successful")
                //perform segway to take you to the next window
                
                self.performSegue(withIdentifier: "goToChat", sender: self) //we add self. in frontun because we are inside a closure.
            }
        }
        

        
        
    } 
    
    
}
