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
                    
                    VStack(alignment: .leading) {
                        Text(character.name)
                            .font(.largeTitle)
                        
                        Text("Portrayed by: \(character.portrayedBy)")
                            .font(.subheadline)
                        
                        Divider()
                        
                        Text("\(character.name) Character info:")
                            .font(.title2)
                        
                        Text("Born: \(character.birthday)")
                        
                        Divider()
                        
                        Text("Occupation:")
                        
                        ForEach(character.occupations, id: \.self) { occupation in
                            Text((occupation))
                                .font(.subheadline)
                        }
                        
                        Divider()
                        
                        Text("Nicknames:")
                        
                        if character.aliases.count > 0 {
                            ForEach(character.aliases, id: \.self) { alias in
                                Text((alias))
                                    .font(.subheadline)
                            }
                        } else {
                            Text("None")
                                .font(.subheadline)
                        }
                    }
                    
                    .frame(width: geo.size.width / 1.25, alignment: .leading)
                    .padding()
                }
                .scrollIndicators(.hidden)
            })
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CharacterView( character: ViewModel().character, show: "Breaking Bad")
}
