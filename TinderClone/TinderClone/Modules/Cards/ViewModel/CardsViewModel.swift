//
//  CardsViewModel.swift
//  TinderClone
//
//  Created by Sarath kumar on 02/08/24.
//

import Foundation

class CardsViewModel: ObservableObject {
    
    @Published var cardModels = [CardModel]()
    
    private let service: CardService
    
    init(service: CardService) {
        self.service = service
        Task { await fetchCardModel() }
    }
    
    func fetchCardModel() async {
        do {
            self.cardModels = try await service.fetchCardModels()
        } catch {
            print("error: failed to get the card models")
        }
    }
}
