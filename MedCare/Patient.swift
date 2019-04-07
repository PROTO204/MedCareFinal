//
//  Patient.swift
//  MedCare
//
//  Created by Priscilla Ikhena on 05/04/2019.
//  Copyright © 2019 Priscilla Ikhena. All rights reserved.
//

import Foundation

class Patient {
    
    //variables to hold the name of the patient, their age,
    var patientName : String =  "" //name of patient
    var patientAge : Int = 0 //the age of the patient
    var patientLocation: String = "" //location of the patient
    var pill : String = "" //this variable holds the name of the pill
    var cadence : Int = 0 //if the cadence is a digit 14, it means the patient should take the drug at 14H. So this number could be 1, 2, ... 22, 23, 0. 0 meaning at midnight. This means at this time, the box is expected to open.
    var patientPerformance : Bool = true //if patient has missed a day, return false, cause it means they're not doing well. If they haven't missed any days
    
    
    
}
