//
//  DataModels.swift
//  Wardrobe
//
//  Created by Jason on 4/8/22.
//

import Foundation
import FirebaseFirestore

public struct User: Codable {
    let username: String
    let email: String
    let fname: String
    let lname: String
    let dob: Date
}

public struct Clothing {
    let uid: UUID
    let name: String
    let brand: String
    let category: String
    let color: String
    let date_upld: Date
    let img: String
}
