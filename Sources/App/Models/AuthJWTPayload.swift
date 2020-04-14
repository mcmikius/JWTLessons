//
//  AuthJWTPayload.swift
//  App
//
//  Created by Mykhailo Bondarenko on 14.04.2020.
//

import Vapor
import JWT

struct AuthJWTPayload: JWTPayload {
    
    func verify(using signer: JWTSigner) throws {
        // nothing for now
    }

    let iss: IssuerClaim
    let uid: UserIDClaim
    let iat: IssuedAtClaim
    let exp: ExpirationClaim
}
