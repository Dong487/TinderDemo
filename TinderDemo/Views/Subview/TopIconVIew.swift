//
//  TopIconVIew.swift
//  TinderDemo
//
//  Created by Dong on 2023/2/8.
//

import SwiftUI

extension HomeView {
    struct TopIconView: View {
        @State private var selectedItem: SFSymbol = .flame
        let frameWidth: CGFloat
        let numberOfTopIcon: Int 
        
        var body: some View {
            HStack {
                ForEach(SFSymbol.allCases.prefix(numberOfTopIcon), id: \.self) {
                    topIconButton(iconName: $0)
                }
            }
        }
    }
}

extension HomeView.TopIconView {
    @ViewBuilder
    func topIconButton(iconName: SFSymbol) -> some View {
        Button {
            withAnimation(.easeInOut){
                selectedItem = iconName
            }
        } label: {
            iconName.body
                .resizable()
                .scaledToFit()
                .foregroundColor(selectedItem == iconName ? iconName.color : .gray)
                .frame(width: 40, height: 40)
        }
        .frame(maxWidth: frameWidth / 4)
    }
}














// 也可以用 struct
//struct TopIconButton: View {
//    @Binding var selectedItem: SFSymbol
//    var iconName: SFSymbol
//    var width: CGFloat
//
//    var body: some View {
//        Button {
//            withAnimation(.easeInOut){
//                selectedItem = iconName
//            }
//        } label: {
//            iconName.body
//                .resizable()
//                .scaledToFit()
//                .foregroundColor(selectedItem == iconName ? iconName.color : .gray)
//                .frame(width: 40, height: 40)
//        }
//        .frame(maxWidth: width / 4)
//    }
//}
