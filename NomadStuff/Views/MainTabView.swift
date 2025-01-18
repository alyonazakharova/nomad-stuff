import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            NavigationStack {
                CountryListView()
                    .navigationTitle("Visa Check")
            }
            .tabItem {
                Label("Visa Check", systemImage: "airplane")
            }
            
            NavigationStack {
                SettingsView()
                    .navigationTitle("Settings")
            }
            .tabItem {
                Label("Settings", systemImage: "gear")
            }
        }
    }
}
