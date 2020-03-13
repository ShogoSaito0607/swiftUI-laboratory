//
//  TitleWithPosition.swift
//  bitpass
//
//  Created by ShogoSaito on 2020/03/13.
//

import SwiftUI

struct TitleWithPosition: View {
    var title: String = ""
    var width: CGFloat = 0
    var height: CGFloat = 0
    var isPoint: Bool = false
    var body: some View {
        VStack {
            Spacer().frame(height: UIScreen.main.bounds.height * 0.1)
            Text(self.title)
            HStack {
                if isPoint {
                    Text("x: " + String(format: "%.01f", Float(self.width)))
                    Text("y: " + String(format: "%.01f", Float(self.height)))
                } else {
                    Text("width: " + String(format: "%.01f", Float(self.width)))
                    Text("height: " + String(format: "%.01f", Float(self.height)))
                }
            }
            Spacer()
        }
    }
}

struct TitleWithPosition_Previews: PreviewProvider {
    static var previews: some View {
        TitleWithPosition()
    }
}
