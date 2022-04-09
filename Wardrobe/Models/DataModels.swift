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
