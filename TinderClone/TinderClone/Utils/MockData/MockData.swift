//
//  MockData.swift
//  TinderClone
//
//  Created by Sarath kumar on 02/08/24.
//

import Foundation

struct MockData {
    static let users: [User] = [
        .init(id: NSUUID().uuidString, fullName: "emma watson", age: "28", profileImageURLs: ["emma watson","emma watson"]),
        .init(id: NSUUID().uuidString, fullName: "emma stone", age: "30", profileImageURLs: ["emma-stone","emma-stone"]),
        .init(id: NSUUID().uuidString, fullName: "jessica", age: "31", profileImageURLs: ["jessica","jessica"]),
        .init(id: NSUUID().uuidString, fullName: "KateWinslet", age: "25", profileImageURLs: ["Kate_Winslet","Kate_Winslet"]),
        .init(id: NSUUID().uuidString, fullName: "natalie", age: "26", profileImageURLs: ["natalie-portman","natalie-portman"]),
        .init(id: NSUUID().uuidString, fullName: "Scarlett", age: "33", profileImageURLs: ["Scarlett_Johansson","Scarlett_Johansson"])
    ]
}
