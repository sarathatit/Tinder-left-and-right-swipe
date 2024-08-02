//
//  CardModel.swift
//  TinderClone
//
//  Created by Sarath kumar on 02/08/24.
//

import Foundation

struct CardModel {
    let user: User
}

extension CardModel: Identifiable {
    var id: String {
        return user.id
    }
}
