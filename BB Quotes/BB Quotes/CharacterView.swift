//
//  CharacterView.swift
//  BB Quotes
//
//  Created by Joel Espinal on 25/6/24.
//

import SwiftUI

struct CharacterView: View {
    
    let character: Character
    let show: String
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .top, content: {
                Image(show.lowercased().replacingOccurrences(of: " ", with: ""))
                    .resizable()
                .scaledToFit()
                
                ScrollView {
                    AsyncImage(url: character.images[0]) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: geo.size.width / 1.2, height: geo.size.height / 1.7)
                    .clipShape(.rect(cornerRadius: 25.0))
                .padding(.top, 60.0)
                }
            })
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CharacterView( character: ViewModel().character, show: "Breaking Bad")
}
