//
//  Pockemons.swift
//  PockemonGame
//
//  Created by Mac on 10/17/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class Pockemons {
    
    var latitude:Double?
    var longitude:Double?
    var name:String?
    var image:String?
    var des:String?
    var power:Double?
    var isCatch:Bool?
    
    init(latitude:Double, longitude:Double, name:String, image:String, des:String, power:Double ) {
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        self.image = image
        self.des = des
        self.power = power
        self.isCatch = false
    }
    
}
