//
//  LoginModel.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 14.01.2021.
//

import Foundation

struct UserModel: Decodable {
    let data: User
}

struct User: Decodable {
    let uid: Int
    let name: String
    let email: String
    let accessToken: String
    let role: Int
    let status: Int
    let createdAt: Int
    let updatedAt: Int
}
