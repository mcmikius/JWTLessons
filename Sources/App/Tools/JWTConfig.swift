//
//  JWTConfig.swift
//  App
//
//  Created by Mykhailo Bondarenko on 14.04.2020.
//

import Vapor
import JWT

protocol JWTConfig: Service {
    func signer() throws -> JWTSigner
}
