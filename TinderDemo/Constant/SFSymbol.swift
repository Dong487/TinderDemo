//
//  SFSymbol.swift
//  TinderDemo
//
//  Created by Dong on 2023/2/8.
//

import SwiftUI

// 如果新增要放在 top 的 icon ，要更改 numberOfTopIcon 的數量
enum SFSymbol: String, CaseIterable {
    // topIcon
    case flame = "flame.fill"
    case diamond = "suit.diamond.fill"
    case bubble = "bubble.left.fill"
    case person = "person.fill"
    // bottomIcon
    case goforward
    case xmark
    case star = "star.fill"
    case heart = "heart.fill"
    case bolt = "bolt.fill"
}
// Image
extension SFSymbol: View {
    var body: Image {
        Image(systemName: rawValue)
    }
    
    var color: Color {
        switch self {
        case .flame:
            return Color.red
        case .diamond:
            return Color.yellow
        case .bubble:
            return Color.orange
        case .person:
            return Color.pink
        case .goforward:
            return Color.yellow
        case .xmark:
            return Color.pink
        case .star:
            return Color.blue
        case .heart:
            return Color.green
        case .bolt:
            return Color.purple
        }
    }
}

//    func resizable() -> Image {
//        self.body.resizable()
//    }
//}
