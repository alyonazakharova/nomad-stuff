//import SwiftUI
//
//struct SettingsView: View {
//    @Environment(\.dismiss) private var dismiss
//    @AppStorage("citizenshipCountry") private var citizenshipCountry: String = ""
//    
//    var body: some View {
//        VStack {
//            Text("To be done yet")
//                .font(.title)
//                .bold(true)
//                .padding()
//            Text("Selected citizenship: \(citizenshipCountry)")
//                .padding()
//            
//        }
//    }
//}


import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @AppStorage("citizenshipCountry") private var citizenshipCountry: String = ""
    @State private var showingCitizenshipSelection = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Citizenship") {
                    HStack {
                        Text("Country")
                        Spacer()
                        Text(citizenshipCountry.isEmpty ? "Not selected" : citizenshipCountry)
                            .foregroundColor(.gray)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        showingCitizenshipSelection = true
                    }
                }
                
                // Add other settings sections here
            }
            .navigationTitle("Settings")
            .sheet(isPresented: $showingCitizenshipSelection) {
                CitizenshipSelectionView(isPresented: $showingCitizenshipSelection)
            }
        }
    }
}
