//
//  GetDatatProtocol.swift
//  kimSeonWoo-practice
//
//  Created by Seonwoo Kim on 2023/10/07.
//


import Foundation

protocol GetDataProtocol {
    func getLoginData(email: String, password: String, switchStatus: String)
}
