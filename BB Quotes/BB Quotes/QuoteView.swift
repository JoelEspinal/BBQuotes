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
                    Text("\"\(viewModel.quote.quote)\"")
                        .multilineTextAlignment(.center)
                }
                .frame(width: geo.size.width)
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
