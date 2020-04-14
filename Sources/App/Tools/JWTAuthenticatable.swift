//
//  JWTAuthenticatable.swift
//  App
//
//  Created by Mykhailo Bondarenko on 14.04.2020.
//

import Vapor
import Authentication
import JWT

protocol JWTAuthenticatable: Authenticatable {
    
    associatedtype JWTType: JWTPayload
    
    static func authenticate(jwt: JWTType, on connection: DatabaseConnectable) -> Future<Self?>
}
