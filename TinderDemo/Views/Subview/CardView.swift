//
//  CardView.swift
//  TinderDemo
//
//  Created by Dong on 2023/2/8.
//

import SwiftUI

extension HomeView {
    struct CardView: View {
        @State var transition: CGSize = .zero
        @State var goodOpacity: Double = 0
        @State var nopeOpacity: Double = 0
        @State var users: [UserModel] = UserModel.examples
        let frameWidth: CGFloat
        
        @State var transitionStart: CGFloat = 0
        @State var transitionEnd: CGFloat = 0
        
        var body: some View {
            GeometryReader { proxy in
                ForEach(users) { user in
                    ZStack {

                        ZStack(alignment: .bottomLeading){
                            
                            Image(user.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: proxy.size.width - 20, height: proxy.size.height)

                            maskLinearGradient
                            
                            infomationView(user: user)
                        }
                        .cornerRadius(16)
                        .shadow(color: Color.bg2, radius: 6, x: 1, y: 1)
                        .shadow(color: Color.secondary.opacity(0.2), radius: 3, x: -1, y: -1)
                        .shadow(color: Color.secondary.opacity(0.1), radius: 1, x: 2, y: 2)
                        .shadow(color: Color.secondary.opacity(0.2), radius: 2)
                    }
                    .padding(10)
                    .offset(users.last == user ? transition : .zero)
                    .rotationEffect(users.last == user ? .degrees(Double(transition.width) / 15) : .zero)
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                dragInChanged(value: value)
                            })
                            .onEnded({ value in
                                dragOnEnded(value: value)
                            })
                    )
                    .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 1), value: transition)
                }
            }
            .overlay {
                Text("付費解鎖更多......🥶🥶🥶")
                    .font(.system(size: 50, weight: .heavy))
                    .opacity(users.count < 1 ? 1 : 0)
                    .padding(20)
            }
        }
    }
}

private extension HomeView.CardView {
    
     var maskLinearGradient: some View {
        LinearGradient(colors: [.clear, .black.opacity(0.4), .black], startPoint: .top, endPoint: .bottom)
    }
    
    @ViewBuilder
    func infomationView(user: UserModel) -> some View {
        VStack {
            HStack{
                Text("GOOD")
                    .font(.system(size: 40, weight: .heavy))
                    .foregroundColor(.green)
                    .padding(6)
                    .background{
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.green, lineWidth: 6)
                    }
                    .opacity(goodOpacity)
                    
                Spacer()
                
                Text("NOPE")
                    .font(.system(size: 40, weight: .heavy))
                    .foregroundColor(.red)
                    .padding(6)
                    .background{
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.red, lineWidth: 6)
                    }
                    .opacity(nopeOpacity)
            }
            .opacity(users.last == user ? 1 : 0)
            
            Spacer()
            
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(user.name)
                        .font(.system(size: 40, weight: .heavy))
                        .frame(alignment: .bottomLeading)
                    Text(user.location)
                        .font(.system(size: 20, weight: .medium))
                    Text(user.interest)
                        .font(.system(size: 25, weight: .medium))
                    Text(user.message)
                        .font(.system(size: 25, weight: .medium))
                }
                Spacer()
                
                Image(systemName: "info.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
        }
        .foregroundColor(.white)
        .padding(20)
    }
}


private extension HomeView.CardView {
    
    // 拖拉進行中把位移的量傳給 transition
    func dragInChanged(value: DragGesture.Value){
        transition = value.translation

        if value.startLocation.x > value.location.x {
            self.nopeOpacity = (value.startLocation.x - value.location.x) / 150
        } else {
            self.goodOpacity = (value.location.x - value.startLocation.x) / 150
        }
    }
    
    // 拖拉結束
    func dragOnEnded(value: DragGesture.Value){
        // 判斷手指滑動距離是否大於 150
        if value.startLocation.x - 150 > value.location.x {
            transition = .init(width: -800, height: 0) // 大量位移產生出掉落動畫效果
            nopeOpacity = 0
            // 太快刪除動畫會不流暢
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                users.removeLast()  // 刪除最後一項(拖拉的那一張)
                transition = .zero  // 歸位(給下一張繼續追蹤使用)
            }
           
        } else if value.startLocation.x + 150 < value.location.x {
            transition = .init(width: 800, height: 0)
            goodOpacity = 0
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                users.removeLast()
                transition = .zero
            }
            
        } else {
            goodOpacity = 0
            nopeOpacity = 0
            transition = .zero
        }
    }
}
