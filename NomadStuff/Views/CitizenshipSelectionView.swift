import SwiftUI

struct CitizenshipSelectionView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationStack {
            CountrySearchListView(
                countries: CountriesList.all,
                onCountrySelected: { country in
                    print("\(country) is selected as the country of citizenship")
                    CountryManager.shared.saveCountry(country)
                    isPresented = false
                }
            )
            .navigationTitle("Select Citizenship")
            .navigationBarBackButtonHidden(true)
        }
    }
}
