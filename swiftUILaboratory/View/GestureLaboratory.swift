//
//  GestureLaboratory.swift
//  bitpass
//
//  Created by ShogoSaito on 2020/03/13.
//

import SwiftUI

struct GestureLaboratory: View {
    @State(initialValue: "") private var pressDetector: String
    
    // 押されたかどうかを検知してアニメーションに利用する
    @State(initialValue: false) private var isPressed: Bool

    // Gestureのupdatingにて利用する
    @GestureState private var longPressTap = false
    
    @State(initialValue: 0) private var currentXPoint: CGFloat
    @State(initialValue: 0) private var currentYPoint: CGFloat
    
    
    @State private var points:[CGPoint] = [CGPoint(x:0,y:0), CGPoint(x:50,y:50)]
    var body: some View {
        ZStack {
            TitleWithPosition(title: "Gestureラボ", width: self.currentXPoint, height: self.currentYPoint, isPoint: true)
            DescriptionView(text: ".gesture(DragGesture().onChanged({ val in self.currentXPoint = val.location.x self.currentYPoint = val.location.y}).onEnded({ val in self.currentXPoint = 0 self.currentYPoint = 0}))")
            VStack {
                Text("DragGestureから、Drag中のx, y座標を取得可能。\nこの場合の始点はGestureを付与したオブジェクトの左上端となる。")
                Spacer().frame(height: UIScreen.main.bounds.height * 0.3)
            }
            self.centerRectangle
            self.detectorText
            self.redPointer
            NextButton()
        }.edgesIgnoringSafeArea([.top, .bottom])
    }
    
    private var centerRectangle: some View {
        Rectangle()
            .fill(longPressTap ? Color.blue.opacity(0.3): Color.yellow.opacity(0.3))
            .frame(width: 100, height: 100)
            .scaleEffect(isPressed ? 0.5: 1.0)
            .animation(.easeInOut)
            .gesture(
                //minimumDurationは 何秒たったらendedを自動発火させるか、と捉えると良い
                //GestureStateは、miniumumDurationを過ぎると勝手に初期値に戻る。
                //下でDragGestureも付与しているが、長押ししてから動かしてしまうとDrag扱いになりLongPressは発火しない。
                LongPressGesture(minimumDuration: 3.0)
                    .updating($longPressTap, body: { (currentState, gestureState, transaction) in
                        gestureState = currentState
                    })
                    // onChangedは長押ししている間ずっと発火し続ける
                    // ちょんとタップしただけでも発火してしまうので注意
                    .onChanged({ _ in
                        self.pressDetector = "長押ししてます"
                    })
                    .onEnded({ _ in
                        self.isPressed.toggle()
                        self.pressDetector = self.isPressed ? "長押ししました" : ""
                    })
            )
            .gesture(
                DragGesture()
                    // このDragGestureを付与した
                    .onChanged({ val in
                        self.currentXPoint = val.location.x
                        self.currentYPoint = val.location.y
                    })
                    .onEnded({ val in
                        self.currentXPoint = 0
                        self.currentYPoint = 0
                    })
            )
// 下記でも悪くはないが、できることが限られる、と思われる。
//                .onTapGesture {
//                    self.pressDetector = "tapしてます"
//                }
//                .onLongPressGesture(perform: {
//                    self.pressDetector = "長押ししてます"
//                })
    }
    private var redPointer: some View {
        Color.red
        .frame(width:10, height:10, alignment: .center)
        .clipShape(Circle())
        .offset(CGSize(width: self.currentXPoint - 50, height: self.currentYPoint - 50))
    }
    private var detectorText: some View {
        Text(self.pressDetector).bold().foregroundColor(.red)
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
                    destination: EmptyView(),
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

struct GestureLaboratory_Previews: PreviewProvider {
    static var previews: some View {
        GestureLaboratory()
    }
}
