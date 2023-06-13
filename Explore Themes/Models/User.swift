//
//  User.swift
//  Explore Themes
//
//  Created by Jon Salkin on 6/11/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
