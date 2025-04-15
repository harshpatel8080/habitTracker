package com.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.auth0.jwt.interfaces.JWTVerifier;

@Service
public class JwtService {

	@Value("${jwt.secret}")
	private String secret;

	@Value("${jwt.expiration}")
	private long expiration;

	public String generateToken(String attribute) {
		return JWT.create().withSubject(attribute).withIssuer("YourApp").withIssuedAt(new Date())
				.withExpiresAt(new Date(System.currentTimeMillis() + expiration)).sign(Algorithm.HMAC256(secret));
	}

	public  String validateToken(String token) {
		try {
			System.out.println(token);
			JWTVerifier verifier = JWT.require(Algorithm.HMAC256(secret)).withIssuer("YourApp").build();
			DecodedJWT decodedJWT = verifier.verify(token);
			return decodedJWT.getSubject();

		} catch (JWTVerificationException e) {
			return null;
		}
	}

}
