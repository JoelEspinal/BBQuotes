//
//  QuoteView.swift
//  BB Quotes
//
//  Created by Joel Espinal on 13/6/24.
//

import SwiftUI

struct QuoteView: View {
    let viewModel = ViewModel()
    let show: String
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(show.lowercased()
                    .replacingOccurrences(of: " ", with: ""))
                .resizable()
                .frame(width: geo.size.width * 2.7, height: geo.size.height * 1.2)
                VStack {
                    Spacer()
                    Text("\"\(viewModel.quote.quote)\"")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding()
                        .background(.black.opacity(0.5))
                        .clipShape(.rect(cornerRadius: 25))
                        .padding(.horizontal)
                    ZStack (alignment: .bottom){
                        AsyncImage(url: viewModel.character.images[0]) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: geo.size.width / 1.1, height: geo.size.height / 1.8)
                        
                        Text(viewModel.quote.character)
                            .foregroundStyle(.white)
                            .padding(10)
                            .frame(maxWidth: .infinity)
                            .background(.ultraThinMaterial)
                    }
                    .frame(width: geo.size.width / 1.1, height: geo.size.height / 1.8)
                    .clipShape(.rect(cornerRadius: 50))
                
                    Button {
                        
                    } label: {
                        Text("Get Random Quote")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("BreakingBadGreen"))
                            .clipShape(.rect(cornerRadius: 7))
                            .shadow(color: Color("BreakingBadYellow"), radius: 2)
                    }
                   Spacer(minLength: 95)
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
    }
       
}

#Preview {
    QuoteView(show: "Better Call Saul")
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
