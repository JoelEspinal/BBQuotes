//
//  FetchService.swift
//  BB Quotes
//
//  Created by Joel Espinal on 12/6/24.
//

import Foundation

struct FetchService {
    
    enum FetchError: Error {
        case badResponse
    }
    
    let baseURL = URL(string: "https://breaking-bad-api-six.vercel.app/api")!
    
    func fetchQoute(from show: String) async throws -> Quote {
        // Build fecth url
        let quoteURL = baseURL.appending(path: "quote/random")
        let fetchURL = quoteURL.appending(queryItems: [URLQueryItem(name: "production", value: show)])
        
        // Fetch data
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        // Handle response
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
            }
        
        // Decode data
        let quote = try JSONDecoder().decode(Quote.self, from: data)
        
        return quote
    }
}
