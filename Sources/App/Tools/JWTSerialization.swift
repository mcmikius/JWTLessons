//
//  JWTSerialization.swift
//  App
//
//  Created by Mykhailo Bondarenko on 14.04.2020.
//

import Vapor
import JWT

struct JWTSerialization<T: JWTPayload> {

    func encode(_ payload: T, on container: Container) throws -> String {
        let jwt = JWT(payload: payload)
        let config = try container.make(JWTConfig.self)
        let encoded = try jwt.sign(using: config.signer())
        guard let jwtString = String(data: encoded, encoding: .utf8) else {
            throw AuthJWTError.invalidDataEncoding
        }
        return jwtString
    }

    func decode(_ string: String, on container: Container) throws -> T {
        let config = try container.make(JWTConfig.self)
        let jwt = try JWT<T>(from: string, verifiedUsing: config.signer())
        return jwt.payload
    }
}
