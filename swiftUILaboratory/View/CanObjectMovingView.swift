import SwiftUI

struct CanObjectMovingView: View {
    @State private var currentPosition: CGSize = .zero
    @State private var newPosition: CGSize = .zero
    
    var body: some View {
        ZStack {
            TitleWithPosition(title: "物体を自由に動かせるようにする", width: self.currentPosition.width, height: self.currentPosition.height)
            DescriptionView(text: "Rectangle().frame(width: 100, height: 100).offset(x: self.currentPosition.width, y:self.currentPosition.height).gesture(DragGesture().onChanged { value in self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)}.onEnded { value in self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height) self.newPosition = self.currentPosition})".reshapeText())
            Rectangle()
               .frame(width: 100, height: 100)
               .foregroundColor(Color.red)
               .offset(x: self.currentPosition.width, y: self.currentPosition.height)
               .gesture(DragGesture()
                    // 3.
                   .onChanged { value in
                       self.currentPosition =
                        CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                    }
                    // 4.
                   .onEnded { value in
                       self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                       self.newPosition = self.currentPosition
                   }
             )
             NextButton()
        }.edgesIgnoringSafeArea([.top, .bottom])
    }
}

struct CanObjectMovingView_Previews: PreviewProvider {
    static var previews: some View {
        CanObjectMovingView()
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
                    destination: SimpleAnimationView(),
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
