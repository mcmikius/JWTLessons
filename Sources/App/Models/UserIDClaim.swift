//
//  UserIDClaim.swift
//  App
//
//  Created by Mykhailo Bondarenko on 14.04.2020.
//

import Vapor
import JWT

struct UserIDClaim: JWTClaim {
    var value: UUID
}
