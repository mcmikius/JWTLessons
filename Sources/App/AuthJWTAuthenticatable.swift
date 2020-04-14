//
//  AuthJWTAuthenticatable.swift
//  App
//
//  Created by Mykhailo Bondarenko on 14.04.2020.
//

import Vapor
import Authentication
import JWT

struct AuthJWTAuthenticatable: JWTAuthenticatable {
    
    typealias JWTType = AuthJWTPayload

    let user: User

    static func authenticate(jwt: JWTType, on connection: DatabaseConnectable) -> Future<AuthJWTAuthenticatable?> {
        return User.query(on: connection).filter(\.id == jwt.uid.value).first().map { user in
                return user.map { AuthJWTAuthenticatable(user: $0) }
            }
    }

}
