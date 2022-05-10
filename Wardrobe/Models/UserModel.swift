//
//  UserModel.swift
//  Wardrobe
//
//  Created by Student Account on 4/8/22.
//

import Foundation

struct User: Codable {
    let uid: UUID
    let username: String
    let email: String
    let fname: String
    let lname: String
    let dob: String
}
