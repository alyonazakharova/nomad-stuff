import SwiftUI

struct CountryListView: View {
    @StateObject private var viewModel = CountryListViewModel()
    @AppStorage("citizenshipCountry") private var citizenshipCountry: String = ""
    @State private var searchText = ""
    @State private var showingResultView = false
    
    var filteredCountries: [Country] {
        if searchText.isEmpty {
            return viewModel.countries
        } else {
            return viewModel.countries.filter { country in
                country.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 0) { // Already have spacing: 0 here, good!
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("What is your destination?", text: $searchText)
                    .autocapitalization(.none)
                
                if !searchText.isEmpty {
                    Button(action: {
                        searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.vertical, 8)
            
            List(filteredCountries) { country in
                CountryRowView(country: country) {
                    showingResultView = true
                    viewModel.selectCountry(country, citizenshipCountry: citizenshipCountry)
                }
            }
            .listStyle(PlainListStyle()) // Add this for a cleaner look
        }
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
