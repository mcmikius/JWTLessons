//
//  User.swift
//  App
//
//  Created by Mykhailo Bondarenko on 14.04.2020.
//

import FluentSQLite
import Vapor

final class User: SQLiteUUIDModel {
    
    var id: UUID?
    var login: String
    var password: String
    
    init(id: UUID? = nil, login: String, password: String) {
        self.id = id
        self.login = login
        self.password = password
    }
}
