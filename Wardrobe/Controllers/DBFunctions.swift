//
//  ViewController.swift
//  Wardrobe
//
//  Created by Jason on 4/8/22.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage

let db = Firestore.firestore()
let storage = Storage.storage()
let user = Auth.auth().currentUser

func addNewUser(user: User) {
    
    db.collection("users").document().setData([
        "username": user.username,
        "email": user.email,
        "fname": user.fname,
        "lname": user.lname,
        "dob": user.dob
    ]) { err in
        if let err = err {
            print("Error writing document: \(err)")
        } else {
            print("Document successfully written!")
        }
    }
    newCloset(username: user.username)
}

private func newCloset(username:String) {
    let mycloset = db.collection("users").document(username).collection("closet").document("mycloset")
    mycloset.collection("accessories")
    mycloset.collection("feet")
    mycloset.collection("head")
    mycloset.collection("legs")
    mycloset.collection("torso")
}

func addClothing(category:String, item: Item) {
    let userRef = user?.uid
    let storageRef = storage.reference()
    let collection = db.collection("users").document(user!.uid as String).collection("closet").document("mycloset").collection(category)
    let closet = db.collection("users").document(user!.uid as String)
    
    collection.document(item.name).setData([
        "name": item?.name,
        "uid": item?.uid as String,
        "brand": item?.brand,
        "category": item?.category,
        "color": item?.color,
        "date_upld": item?.dateupload,
        "img": item?.imgurl
    ])
}

func updateClothing() {}

func deleteClothing() {}

