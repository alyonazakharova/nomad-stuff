import Foundation

struct ApiResponse: Codable {
    let id: Int
    let passport: CountryInfo
    let destination: CountryInfo
    let dur: Int?
    let category: VisaCategory
    let lastUpdated: String
    
    // CodingKeys to map JSON keys to Swift property names
    enum CodingKeys: String, CodingKey {
        case id
        case passport
        case destination
        case dur
        case category
        case lastUpdated = "last_updated"
    }
}

struct CountryInfo: Codable {
    let name: String
    let code: String
}

struct VisaCategory: Codable {
    let name: String
    let code: String
}
