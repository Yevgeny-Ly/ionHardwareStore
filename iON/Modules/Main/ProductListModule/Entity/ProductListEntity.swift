//
//  ProductListEntity.swift
//  iON
//
//  Created by Евгений Л on 02.10.2023.
//

import UIKit

struct Product {
    var id: String
    var statusFlagFavorite: Bool
    var picture: String
    var name: String
    var cost: String
    var oldCost: String
    var description: String
    
    init(attributes: [String: String]) {
        self.id = attributes["id"] ?? "no id"
        self.statusFlagFavorite = false
        self.picture = attributes["picture"] ?? "no picture"
        self.name = attributes["name"] ?? "no name"
        self.cost = attributes["cost"] ?? "0"
        self.oldCost = attributes["oldCost"] ?? "0"
        self.description = attributes["description"] ?? "no description"
    }
}


