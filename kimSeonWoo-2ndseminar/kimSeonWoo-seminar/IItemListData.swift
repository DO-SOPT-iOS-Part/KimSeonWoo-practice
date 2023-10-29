//
//  ImemListData.swift
//  kimSeonWoo-seminar
//
//  Created by Seonwoo Kim on 2023/10/28.
//

struct ItemListData {
    let image: String
    let item: String
    let location: String
    let price: String
    var isLike: Bool
    
    init(image: String, item: String, location: String, price: String, isLike: Bool) {
        self.image = image
        self.item = item
        self.location = location
        self.price = price
        self.isLike = isLike
    }
}

