//
//  ViewModel.swift
//  BB Quotes
//
//  Created by Joel Espinal on 13/6/24.
//

import Foundation

enum FetchStatus {
    case notStarted
    case fetching
    case success
    case failed(error: Error)
}


@Observable
class ViewModel {
        

    private(set) var status: FetchStatus = .notStarted
    private let fetcher = FetchService()
    
    var quote: Quote
    var character: Character
    
    init() {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let quoteData = try! Data(contentsOf: Bundle.main.url(forResource: "samplequote", withExtension: "json")!)
        quote = try! decoder.decode(Quote.self, from: quoteData)
        
        let characterData = try! Data(contentsOf: Bundle.main.url(forResource: "samplecharacter", withExtension: "json")!)
        character = try! decoder.decode(Character.self, from: characterData)
    }
    
    func getData(for show: String) async {
        status = .fetching
        
        do {
            quote = try await fetcher.fetchQoute(from: show)
            character = try await fetcher.fetchCharacter(quote.author)
            character.death = try await fetcher.fetchDeath(for: character.name)
            
            status = .success
        } catch {
            status = .failed(error: error)
        }
    }
}

