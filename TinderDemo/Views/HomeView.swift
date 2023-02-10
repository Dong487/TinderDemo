//
//  HomeView.swift
//  TinderDemo
//
//  Created by Dong on 2023/2/7.
//
import SwiftUI

struct HomeView: View {
    
    var frameWidth: CGFloat { UIScreen.main.bounds.width }
    let numberOfTopIcon = 4
 
    var body: some View {
        VStack(spacing: 20){
            
            TopIconView(frameWidth: frameWidth, numberOfTopIcon: numberOfTopIcon)
            
            CardView(frameWidth: frameWidth)
            
            BottomIconView(frameWidth: frameWidth, numberOfTopIcon: numberOfTopIcon)
        }
        .padding(.bottom)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .previewDevice(.iPad)
            HomeView()
                .previewDevice(.iPhoneSE)
            HomeView()
        }
    }
}


