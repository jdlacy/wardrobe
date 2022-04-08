//
//  ItemModel.swift
//  Wardrobe
//
//  Created by Student Account on 4/8/22.
//

import Foundation
import CoreMedia

class Item {
    var brand = ""
    var category = CategoryEnum.Casual //Casual is just a default category?
    var color = ""
    var dateupload = ""
    var imgurl = ""
    var name = ""
    
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
