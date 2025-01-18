import Foundation

struct Country: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let flag: String
    let code: String
}
