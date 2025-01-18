import SwiftUI

struct LoadingView: View {
    @State private var offsetX = -120.0
    @State private var sparkleOffsets: [Double] = [-120, -140, -160, -180, -200]
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Checking visa requirements...")
                    .font(.headline)
                    .padding(.bottom, 30)
                
                ZStack {
                    ForEach(0..<sparkleOffsets.count, id: \.self) { index in
                        Text("✨")
                            .offset(x: sparkleOffsets[index])
                            .animation(
                                Animation.linear(duration: 0.5)
                                    .repeatForever(autoreverses: false)
                                    .delay(Double(index) * 0.1),
                                value: sparkleOffsets[index]
                            )
                    }
                    
                    Text("🚀")
                        .font(.system(size: 40))
                        .offset(x: offsetX)
                        .animation(
                            Animation.linear(duration: 0.5)
                                .repeatForever(autoreverses: true),
                            value: offsetX
                        )
                }
                .frame(height: 50)
            }
        }
        .onAppear {
            withAnimation {
                offsetX = 120.0
                for i in 0..<sparkleOffsets.count {
                    sparkleOffsets[i] += 240.0
                }
            }
        }
    }
}
