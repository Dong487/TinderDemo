//
//  BottomIconView.swift
//  TinderDemo
//
//  Created by Dong on 2023/2/8.
//

import SwiftUI

extension HomeView {
    struct BottomIconView: View {
        
        let frameWidth: CGFloat
        let numberOfTopIcon: Int
        
        var body: some View {
            HStack {
                ForEach(SFSymbol.allCases.dropFirst(numberOfTopIcon).indices, id: \.self) {
                    bottomIconButton(iconName: SFSymbol.allCases[$0],index: $0)
                }
                .padding(.horizontal,2)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

extension HomeView.BottomIconView{
    @ViewBuilder
    private func bottomIconButton(iconName: SFSymbol, index: Int) -> some View {
        let size: CGFloat = index % 2 == 0 ? 35 : 50   
        Button {
            
        } label: {
            iconName.body
                .font(index % 2 == 0 ? .title3 : .title).bold()
                .foregroundColor(iconName.color)
                .frame(width: size, height: size)
                .padding(16)
                .background{
                    Circle()
                        .frame(width: size + 20, height: size + 20 ,alignment: .center)
                        .shadow(radius: 10)
                        .foregroundStyle(.linearGradient(
                            colors: [.bg2, .bg],
                            startPoint: .center,
                            endPoint: .bottomTrailing)
                        )
                }
                .shadow(color: Color.secondary.opacity(0.2), radius: 10, x: -2, y: -1)
                .shadow(color: Color.secondary.opacity(0.2), radius: 12, x: 2, y: 2)
                .shadow(color: Color.secondary.opacity(0.7), radius: 2)
        }
        .frame(maxHeight: 66)
        .frame(maxWidth: frameWidth / 6)
    }
}
