//
//  ViewController.swift
//  Wardrobe
//
//  Created by Jason on 4/8/22.
//

import SwiftUI
import Firebase
import FirebaseFirestore

let db = Firestore.firestore()

func addNewUser(username:String, email:String, fname:String, lname:String, dob:Date) {
    
    db.collection("users").document().setData([
        "username": username,
        "email": email,
        "fname": fname,
        "lname": lname,
        "dob": dob
    ]) { err in
        if let err = err {
            print("Error writing document: \(err)")
        } else {
            print("Document successfully written!")
        }
    }
    }

//private func newCloset(username:String) {
//    db.collection("users").document(username).collection("closet").addDocument(data"myCloset")
//}
