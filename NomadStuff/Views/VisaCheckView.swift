import SwiftUI

struct VisaCheckView: View {
    @StateObject private var viewModel = VisaCheckViewModel()
    @State private var showingResultView = false
    
    var body: some View {
        CountrySearchListView(
            countries: viewModel.countries,
            onCountrySelected: { country in
                showingResultView = true
                viewModel.selectCountry(country)
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
