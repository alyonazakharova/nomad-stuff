import Foundation

struct Country: Identifiable, Hashable, Codable {
    let id = UUID()
    let name: String
    let flag: String
    let code: String
}
