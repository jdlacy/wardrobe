//
//  ItemModel.swift
//  Wardrobe
//
//  Created by Student Account on 4/8/22.
//

import Foundation
import CoreMedia

struct Item {
    let uid: UUID
    let brand: String
    let category = CategoryEnum.Casual
    let color: String
    let dateupload: String
    let imgurl: String
    let name: String
    
    enum CategoryEnum {
        case Summer
        case Fall
        case Winter
        case Spring
        case Formal
        case Informal
        case BusinessCasual
        case Casual
        case Sleepwear
    }
}
