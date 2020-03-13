//
//  MovingTest.swift
//  bitpass
//
//  Created by ShogoSaito on 2020/03/13.
//

import SwiftUI

// 1. まずはanimationBoolのようなBool値を用意する
// 2. どう動かすかをwithAnimationで定義し、toggleを内部に記述する。
// 3. 動かす対象オブジェクトに、rotaitonEffect(回転)や offset(ポジション)を使って座標や角度を調整する。


struct MovingTest: View {
    @State(initialValue: false) private var animationBool: Bool
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                TitleWithPosition(title: "無限アニメーション", width: self.animationBool ? 0 : 1, height: 0)
                DescriptionView(text: "withAnimation(Animation.easeInOut(duration: 2).repeatForever()) {self.animationBool.toggle()}")
                // ここにコンテンツを入れる
                Rectangle()
                    .frame(width: self.animationBool ? geometry.size.width: 0, height : self.animationBool ? geometry.size.height : 0)
                    .foregroundColor(Color.blue.opacity(0.3))
                    .rotationEffect(Angle.degrees(self.animationBool ? 270: 0))
                    .offset(x: self.animationBool ? UIScreen.main.bounds.width / 4 : 0,
                            y: self.animationBool ? UIScreen.main.bounds.height / 4 : 0)
                NextButton()
            }
        }.onAppear {
            self.startAnimation()
        }.edgesIgnoringSafeArea([.top, .bottom])
    }

    // 画面表示時に無限アニメーションを開始する
    private func startAnimation() -> Void {
        withAnimation(Animation.easeInOut(duration: 2).repeatForever()) {
            // ここでBoolを用いているのは、toggleを使うと0→1が楽だからである。
            self.animationBool.toggle()
        }
    }
}

struct MovingTest_Previews: PreviewProvider {
    static var previews: some View {
        MovingTest()
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
                    destination: GestureLaboratory(),
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
