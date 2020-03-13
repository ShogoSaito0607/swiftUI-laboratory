//
//  TextAnimationView.swift
//  bitpass
//
//  Created by ShogoSaito on 2020/03/13.
//

import SwiftUI

struct SimpleAnimationView: View {
    @State private var startAnimation: Bool = false

    var body: some View {
        ZStack {
            TitleWithPosition(title: "Textを端から端まで動かしてみる", width: UIScreen.main.bounds.width, height: 0, isPoint: true)
            DescriptionView(text: "withAnimation(.easeInOut(duration:2)){self.startAnimation.toggle()}\n Text(`🚚`).font(.custom(`Arial`, size: 100)).offset(x: self.startAnimation ? 0 - UIScreen.main.bounds.width + 100: 0) 何秒で始点から終点まで移動するかがdurationで示される")
            self.content
            NextButton()
        }.edgesIgnoringSafeArea([.top, .bottom])
    }
    
    private var content: some View {
        VStack {
            VStack(spacing: 5) {
                Button("Start Animation Linear") {
                    withAnimation(.linear(duration: 2)) {
                        self.startAnimation.toggle()
                    }
                }
                Button("Start Animation EaseInOut") {
                    withAnimation(.easeInOut(duration: 2)) {
                        self.startAnimation.toggle()
                    }
                }
                Button("Start Animation InteractiveSpring") {
                    withAnimation(Animation.interactiveSpring()) {
                        self.startAnimation.toggle()
                    }
                }
                Button("Start Animation Spring") {
                    //response 動きの速さ 0で瞬間移動する
                    //dampingFraction 動いた後のバネのびよんびよん具合 低いほどびよんびよんする
                    withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.1, blendDuration: 1)) {
                        self.startAnimation.toggle()
                    }
                }
            }
            HStack {
                Spacer()
                Text("🚚")
                    .font(.custom("Arial", size: 100))
                    .offset(x: self.startAnimation ? 0 - UIScreen.main.bounds.width + 100: 0)
            }
        }
    }
}

struct SimpleAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleAnimationView()
    }
}

private struct NextButton: View {
    @State(initialValue: false) var active: Bool
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                NavigationLink(
                    // 遷移先を入れる
                    destination: MovingTest(),
                    isActive: self.$active
                ) {
                    EmptyView()
                }
                Button(action: {
                    self.active = true
                }) {
                    Text("次へ").background(Color.yellow)
                }
            }
            
        }
    }
}
