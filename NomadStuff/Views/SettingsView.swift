import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showingCitizenshipSelection = false
    @State private var citizenshipCountry: Country?
    
    var body: some View {
        Form {
            Section("Citizenship") {
                HStack {
                    Text("Country")
                    Spacer()
                    Text(citizenshipCountry?.name ?? "Not selected")
                        .foregroundColor(.gray)
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    showingCitizenshipSelection = true
                }
            }
        }
//        .scrollContentBackground(.hidden)
        .contentShape(Rectangle())
        .onTapGesture {
            showingCitizenshipSelection = true
        }
        .sheet(isPresented: $showingCitizenshipSelection) {
            CitizenshipSelectionView(isPresented: $showingCitizenshipSelection)
        }
        .onAppear {
            citizenshipCountry = CountryManager.shared.loadSavedCountry()
        }
        .onChange(of: showingCitizenshipSelection) { oldValue, newValue in
            if !newValue {
                citizenshipCountry = CountryManager.shared.loadSavedCountry()
            }
        }
    }
}
