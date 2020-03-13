//
//  TestPlayGround.swift
//  bitpass
//
//  Created by ShogoSaito on 2020/03/11.
//

import SwiftUI

struct TestPlayGround: View {
    var body: some View {
        ZStack {
            VStack {
                Rectangle().fill(Color.blue).opacity(0.1)
                ScrollView {
                    ForEach(0..<90) {_ in
                        Text("test です")
                    }
                    }.background(Color.red)
            }
        }
    }
}

struct TestPlayGround_Previews: PreviewProvider {
    static var previews: some View {
        TestPlayGround()
    }
}
