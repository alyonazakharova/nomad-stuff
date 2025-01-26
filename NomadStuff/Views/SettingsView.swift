import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showingCitizenshipSelection = false
    @State private var citizenshipCountry: Country?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Citizenship")
                .font(.footnote)
                .foregroundColor(.secondary)
                .textCase(.uppercase)
                .padding(.horizontal, 16)
                .padding(.top, 20)
                .padding(.bottom, 8)
            
            VStack(spacing: 0) {
                HStack {
                    Text("Country")
                    Spacer()
                    Text(citizenshipCountry?.name ?? "Not selected")
                        .foregroundColor(.gray)
                    Text(citizenshipCountry?.flag ?? "")
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(10)
                .padding(.horizontal)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                showingCitizenshipSelection = true
            }
            
            Spacer()
        }
        .background(Color(.systemGroupedBackground))
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
