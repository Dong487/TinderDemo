//
//  UserModel.swift
//  TinderDemo
//
//  Created by Dong on 2023/2/8.
//

import SwiftUI

struct UserModel: Identifiable, Equatable{
    var id = UUID()
    var name: String
    var image: String
    var location: String
    var interest: String
    var message: String
    
    static let examples = [
        UserModel(name: "Tom Marvolo Riddle", image: "TomMarvoloRiddle", location: "英國 🇬🇧", interest: "挖鼻孔", message: "☠️☠️"),
        UserModel(name: "Harry Potter", image: "HarryPotter", location: "英國 🇬🇧", interest: "Quidditch", message: "Amazing🪄"),
        UserModel(name: "Harry Potter", image: "HarryPotter", location: "英國 🇬🇧", interest: "Quidditch", message: "Amazing🪄"),
        UserModel(name: "Harry Potter", image: "HarryPotter", location: "英國 🇬🇧", interest: "Quidditch", message: "Amazing🪄"),
        UserModel(name: "Harry Potter", image: "HarryPotter", location: "英國 🇬🇧", interest: "Quidditch", message: "Amazing🪄"),
        UserModel(name: "Harry Potter", image: "HarryPotter", location: "英國 🇬🇧", interest: "Quidditch", message: "Amazing🪄")
    ]
}

