import SwiftUI

struct CitizenshipSelectionView: View {
    @Binding var isPresented: Bool
    @AppStorage("citizenshipCountry") private var citizenshipCountry: String = ""
    
    var body: some View {
        NavigationStack {
            CountrySearchListView(
                countries: CountriesList.all,
                onCountrySelected: { country in
                    citizenshipCountry = country.name
                    isPresented = false
                }
            )
            .navigationTitle("Select Citizenship")
            .navigationBarBackButtonHidden(true)
        }
    }
}
