//
//  JWTAuthenticationMiddleware.swift
//  App
//
//  Created by Mykhailo Bondarenko on 14.04.2020.
//

import Vapor
import JWT
import Authentication

struct JWTAuthenticationMiddleware<A: JWTAuthenticatable>: Middleware {

    func respond(to req: Request, chainingTo next: Responder) throws -> Future<Response> {
        // If the request is already authenticated, go to next middleware
        if try req.isAuthenticated(A.self) {
            return try next.respond(to: req)
        }

        // This parses the JWT string from the Authorization header
        guard let tokenString = req.http.headers.bearerAuthorization?.token else {
            // If there isn't a header, that's fine. Just go to the next middleware
            return try next.respond(to: req)
        }
        // Use my helper type to decode the string into my JWTPayload struct
        let token = try JWTSerialization<A.JWTType>().decode(tokenString, on: req)

        // Ask the JWTAuthenticatable if this is a valid JWT
        return A.authenticate(jwt: token, on: req).flatMap { a in
            if let a = a {
                // The JWT was valid, so this method call stashes the JWTAuthenticatable on the request
                try req.authenticate(a)
            }
            // Regardless of if the JWT is valid or not, go to the next middleware
            return try next.respond(to: req)
        }
    }
}

extension JWTAuthenticationMiddleware: ServiceType {
    static func makeService(for worker: Container) throws -> JWTAuthenticationMiddleware {
        return JWTAuthenticationMiddleware()
    }
}
