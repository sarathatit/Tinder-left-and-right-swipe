//
//  CardService.swift
//  TinderClone
//
//  Created by Sarath kumar on 02/08/24.
//

import Foundation

struct CardService {
    
    func fetchCardModels() async throws -> [CardModel] {
        let users = MockData.users
        return users.map { CardModel(user: $0 )}
    }
}
