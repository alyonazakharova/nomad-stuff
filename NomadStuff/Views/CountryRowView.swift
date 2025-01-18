import SwiftUI

struct CountryRowView: View {
    let country: Country
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack {
                Text(country.flag)
                    .font(.title2)
                Text(country.name)
                    .foregroundColor(.primary)
                Spacer()
                Text(country.code)
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
        }
    }
}
