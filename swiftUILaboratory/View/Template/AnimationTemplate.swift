//
//  AnimationTemplate.swift
//  bitpass
//
//  Created by ShogoSaito on 2020/03/13.
//

import SwiftUI

struct AnimationTemplate: View {
    var body: some View {
        ZStack {
            TitleWithPosition(title: "サンプルタイトル", width: 0, height: 0)
            DescriptionView(text: "サンプル".reshapeText())
            // ここにコンテンツを入れる
            NextButton()
        }
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

struct AnimationTemplate_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTemplate()
    }
}
