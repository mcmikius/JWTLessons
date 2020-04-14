//
//  HmacJWTConfig.swift
//  App
//
//  Created by Mykhailo Bondarenko on 14.04.2020.
//

import Foundation
import Vapor
import JWT

class HmacJWTConfig: JWTConfig {
    private let apiConfig: ApiConfigurationType

    public init(apiConfig: ApiConfigurationType) {
        self.apiConfig = apiConfig
    }

    func signer() throws -> JWTSigner {
        return try JWTSigner.hs256(key: apiConfig.jwtKey.hexEncodedData())
    }
}
