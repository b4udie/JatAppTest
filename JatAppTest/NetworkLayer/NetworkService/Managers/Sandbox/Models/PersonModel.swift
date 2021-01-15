//
//  PersonModel.swift
//  JatAppTest
//
//  Created by Val Bratkevich on 15.01.2021.
//

import Foundation

struct PersonModel: Decodable {
    let data: Person
}

struct Person: Decodable {
    let name: String
    let email: String
    let firstName: String
    let lastName: String
    let title: String
    let phoneNumber: String
    let timezone: String
    let country: String
    let city: String
    let address: String
    let latitude: Double
    let longitude: Double
    let ipAddress: String
    let bio: String
}
