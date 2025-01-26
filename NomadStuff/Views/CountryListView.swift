import SwiftUI

struct CountryListView: View {
    @StateObject private var viewModel = CountryListViewModel()
    @AppStorage("citizenshipCountry") private var citizenshipCountry: String = ""
    @State private var showingResultView = false
    
    var body: some View {
        CountrySearchListView(
            countries: viewModel.countries,
            onCountrySelected: { country in
                showingResultView = true
                viewModel.selectCountry(country, citizenshipCountry: citizenshipCountry)
            }
        )
        .sheet(isPresented: $showingResultView) {
            if let response = viewModel.visaResponse {
                ResultView(response: response)
            } else {
                LoadingView()
            }
        }
        .alert("Error", isPresented: $viewModel.showingError) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(viewModel.errorMessage ?? "Unknown error")
        }
    }
}
