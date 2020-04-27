//
//  Food.swift
//  WareHouse
//
//  Created by 김호중 on 2020/04/27.
//  Copyright © 2020 hojung. All rights reserved.
//

import Foundation
import RealmSwift

enum FoodCategory : Int {
    case Grain, Potato, Sugars, Pulses, SeedsAndNuts, Vegetables, Mushrooms, Fruits, Meat, Eggs, Seafoods, Seaweed, MilkProducts, FatAndOils, Drinks, Seasoning, Etc
    
    static var count: Int {
        return FoodCategory.Etc.rawValue + 1
        
    }
    
    var description: String {
        switch self {
            case .Grain : return "곡류"
            case .Potato : return "감자류"
            case .Sugars : return "당류"
            case .Pulses : return "두류"
            case .SeedsAndNuts : return "종실류"
            case .Vegetables : return "채소류"
            case .Mushrooms : return "버섯류"
            case .Fruits : return "과실류"
            case .Meat : return "육류"
            case .Eggs : return "난류"
            case .Seafoods : return "어패류"
            case .Seaweed : return "해조류"
            case .MilkProducts : return "유제품류"
            case .FatAndOils : return "유지류"
            case .Drinks : return "음료"
            case .Seasoning : return "조미료류"
            case .Etc : return "기타"
        }
    }
}

class Food: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var expDate: Date = Date(timeIntervalSinceNow: 0)
    @objc private dynamic var categoryRawState = FoodCategory.Grain.rawValue
    public var category: FoodCategory {
        get {
            return FoodCategory(rawValue: categoryRawState)!
            
        } set {
            categoryRawState = newValue.rawValue
            
        }
        
    }

}


