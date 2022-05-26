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
    let mycloset = db.collection("users").document("\(username)").collection("closet").document("mycloset")
    mycloset.collection("accessories")
    mycloset.collection("feet")
    mycloset.collection("head")
    mycloset.collection("legs")
    mycloset.collection("torso")
}

func addClothing(category:String, item:Item, image: UIImage, name:String, username:String) {
    let userCollection = db.collection("users").document("\(username)").collection("closet").document("mycloset").collection("\(category)")
    let itemName = item.name
    let imageRef = storage.reference().child("\(String(describing: user?.uid))/photos")
    let imageURL: Void = imageRef.downloadURL { url, error in
        if let error = error{
            print("Error fetching URL: \(error.localizedDescription)")
        } else {
            imageRef.child("/\(name)")
        }
        
    }
    uploadPhoto(image: image, name: name)
    
    
    userCollection.document("\(itemName)").setData([
        "name": item.name,
        "uid": item.uid,
        "brand": item.brand,
        "category": item.category,
        "color": item.color,
        "date_upload": item.dateupload,
        "img": imageURL
    ])
    
    
    
}

func uploadPhoto(image:UIImage, name:String) {
    let userFolder = user?.uid
    if let imageData = image.jpegData(compressionQuality: 1) {
        storage.reference().child("\(String(describing: userFolder))/photos").putData(imageData, metadata: nil){
            (_, err) in
            if let err = err {
                print("Error uploading photo: \(err.localizedDescription)")
            } else {
                print("Upload successful")
            }
        }
    } else {
        print("Couldn't unwrap/case image to data")
    }
}

func updateClothing() {}

func deleteClothing() {}

