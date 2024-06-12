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
}
