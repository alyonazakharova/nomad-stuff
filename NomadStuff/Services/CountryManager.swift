import Foundation

final class CountryManager {
    static let shared = CountryManager()
    
    private init() {}
    
    func saveCountry(_ country: Country) {
        if let encodedData = try? JSONEncoder().encode(country) {
            UserDefaults.standard.set(encodedData, forKey: "citizenship")
        }
    }
    
    func loadSavedCountry() -> Country? {
        guard let savedData = UserDefaults.standard.data(forKey: "citizenship"),
              let decodedCountry = try? JSONDecoder().decode(Country.self, from: savedData) else {
            return nil
        }
        return decodedCountry
    }
}
