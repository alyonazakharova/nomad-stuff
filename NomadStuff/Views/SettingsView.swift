import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @AppStorage("citizenshipCountry") private var citizenshipCountry: String = ""
    
    var body: some View {
        VStack {
            Text("To be done yet")
                .font(.title)
                .bold(true)
                .padding()
            Text("Selected citizenship: \(citizenshipCountry)")
                .padding()
            
        }
    }
}
