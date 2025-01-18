import SwiftUI

struct ContentView: View {
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true
    @AppStorage("citizenshipCountry") private var citizenshipCountry: String = ""
    
//    init() {
//        UserDefaults.standard.set(true, forKey: "isFirstLaunch")
//    }
    
    var body: some View {
        MainTabView()
            .sheet(isPresented: $isFirstLaunch) {
                CitizenshipSelectionView(isPresented: $isFirstLaunch)
            }
    }
}

#Preview {
    ContentView()
}
