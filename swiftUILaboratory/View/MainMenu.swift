//
//  MainMenu.swift
//  bitpass
//
//  Created by ShogoSaito on 2020/03/13.
//

import SwiftUI

struct MainMenu: View {
    var body: some View {
        NavigationView{
            VStack(spacing: 5) {
                NavigationLink(destination: CanObjectMovingView()) {
                        Text("オブジェクトの動かし方を学ぶ")
                            .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.1)
                            .background(Color.blue.opacity(0.3))
                            .cornerRadius(20)
                }
                NavigationLink(destination: SimpleAnimationView()) {
                        Text("横移動アニメーションを学ぶ")
                            .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.1)
                            .background(Color.blue.opacity(0.3))
                            .cornerRadius(20)
                }
                NavigationLink(destination: MovingTest()) {
                        Text("アニメーション応用編: 無限")
                            .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.1)
                            .background(Color.blue.opacity(0.3))
                            .cornerRadius(20)
                }
                NavigationLink(destination: GestureLaboratory()) {
                        Text("ジェスチャーイベントの取得")
                            .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.1)
                            .background(Color.blue.opacity(0.3))
                            .cornerRadius(20)
                }
            }
        }
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
