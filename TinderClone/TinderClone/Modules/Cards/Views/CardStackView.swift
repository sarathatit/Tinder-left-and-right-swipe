//
//  CardStackView.swift
//  TinderClone
//
//  Created by Sarath kumar on 02/08/24.
//

import SwiftUI

struct CardStackView: View {
    @StateObject var viewModel = CardsViewModel(service: CardService())
    var body: some View {
        ZStack {
            ForEach(viewModel.cardModels) { cards in
                CardView(model: cards)
            }
        }
    }
}

#Preview {
    CardStackView()
}
