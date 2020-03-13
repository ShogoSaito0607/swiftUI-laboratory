//
//  DescriptionView.swift
//  swiftUILaboratory
//
//  Created by ShogoSaito on 2020/03/13.
//

import SwiftUI

struct DescriptionView: View {
    var text: String = ""
    var body: some View {
        VStack {
            Spacer()
            Text(self.text.reshapeText()).italic().font(.system(size: 12)).padding([.bottom])
        }
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView()
    }
}
