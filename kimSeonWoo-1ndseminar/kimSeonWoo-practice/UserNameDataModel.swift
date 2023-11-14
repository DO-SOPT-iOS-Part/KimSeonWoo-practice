//
//  UserNameDataModel.swift
//  kimSeonWoo-practice
//
//  Created by Seonwoo Kim on 2023/11/11.
//

import Foundation

struct UserNameCheckDataModel: Codable {
    let isExist: Bool
    
    enum CodingKeys: CodingKey {
        case isExist
    }
}
