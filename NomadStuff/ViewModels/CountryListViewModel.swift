import Foundation

class CountryListViewModel: ObservableObject {
    @Published var countries = CountriesList.all
    @Published var errorMessage: String?
    @Published var showingError = false
    @Published var visaResponse: ApiResponse?
    
    func selectCountry(_ country: Country, citizenshipCountry: String) {
        self.visaResponse = nil
        
        let urlString = "https://rough-sun-2523.fly.dev/visa/TR/\(country.code)"
//        let urlString = "https://rough-sun-2523.fly.dev/visa/\(citizenshipCountry)/\(country.code)/"
        print("Attempting to fetch from URL:", urlString)
        
        guard let url = URL(string: urlString) else {
            print("Failed to construct URL")
            self.errorMessage = "Invalid URL"
            self.showingError = true
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        print("Starting network request...")
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            print("Received network response")
            
            DispatchQueue.main.async {
                if let error = error {
                    print("Network error:", error)
                    self?.errorMessage = error.localizedDescription
                    self?.showingError = true
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    print("Invalid response type")
                    self?.errorMessage = "Invalid response"
                    self?.showingError = true
                    return
                }
                
                print("HTTP Status code:", httpResponse.statusCode)
                
                guard (200...299).contains(httpResponse.statusCode) else {
                    print("Server error with status code:", httpResponse.statusCode)
                    if let data = data, let responseString = String(data: data, encoding: .utf8) {
                        print("Error response body:", responseString)
                    }
                    self?.errorMessage = "Server error: \(httpResponse.statusCode)"
                    self?.showingError = true
                    return
                }
                
                guard let data = data else {
                    print("No data received")
                    self?.errorMessage = "No data received"
                    self?.showingError = true
                    return
                }
                
                if let responseString = String(data: data, encoding: .utf8) {
                    print("Raw response:", responseString)
                }
                
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(ApiResponse.self, from: data)
                    print("Successfully decoded response:", response)
                    self?.visaResponse = response
                } catch {
                    print("Decoding error:", error)
                    print("Decoding error details:", error.localizedDescription)
                    self?.errorMessage = "Failed to decode response: \(error.localizedDescription)"
                    self?.showingError = true
                }
            }
        }.resume()
    }
}
