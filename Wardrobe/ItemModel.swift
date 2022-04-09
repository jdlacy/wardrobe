//
//  ItemModel.swift
//  Wardrobe
//
//  Created by Student Account on 4/8/22.
//

import Foundation
import CoreMedia

struct Item {
    var brand: String
    var category = CategoryEnum.Casual
    var color: String
    var dateupload: String
    var imgurl: String
    var name: String
    
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
