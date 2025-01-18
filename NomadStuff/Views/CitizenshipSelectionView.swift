import SwiftUI

struct CitizenshipSelectionView: View {
    @Binding var isPresented: Bool
    @AppStorage("citizenshipCountry") private var citizenshipCountry: String = ""
    
    var body: some View {
        NavigationStack {
            List(CountriesList.all) { country in
                CountryRowView(country: country) {
                    citizenshipCountry = country.name
                    isPresented = false
                }
            }
            .navigationTitle("Select Citizenship")
            .navigationBarBackButtonHidden(true)
        }
    }
}
