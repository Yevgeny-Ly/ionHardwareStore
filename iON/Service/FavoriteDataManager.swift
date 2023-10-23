//
//  FavoriteDataManager.swift
//  iON
//
//  Created by Евгений Л on 12.10.2023.
//

import UIKit

class FavoriteDataManager {
    private let FAVORITE_KEY = "FAVORITE_KEY" // ключ для наших товаров
    
// записываю set для сохранения id избранных товаров в UserDefaults
    func save(items: Set<String>) {
        let array = Array(items)
        UserDefaults.standard.setValue(array, forKey: FAVORITE_KEY) // забираю id значения товаров
    }
    
// получаю cписок товаров
    func get() -> Set<String> {
        let array = UserDefaults.standard.array(forKey: FAVORITE_KEY) as? [String] ?? [] // собираю id значения товаров
        return Set(array)
    }
    
    static var shared: FavoriteDataManager = FavoriteDataManager()
}

