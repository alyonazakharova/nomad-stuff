import SwiftUI

struct ResultView: View {
    @Environment(\.dismiss) private var dismiss
    let response: ApiResponse
    
    var resultInfo: (title: String, info: String) {
        switch response.category.code {
        case "VF":
            return ("Woohoo!🥳", "\(response.destination.name) is visa free")
        case "VR":
            return ("Eh...", "You need a visa to visit \(response.destination.name)")
        case "EV", "VOA":
            return ("Not great, not terrible", "\(response.destination.name) requires \(response.category.name)")
        default :
            return ("Woof", "Something unexpected happened")
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text(resultInfo.title)
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Text(resultInfo.info)
                .font(.title2)
                .multilineTextAlignment(.center) 
                .padding()
            
            if response.category.code == "VF", let duration = response.dur {
                Text("Stay up to \(duration) days")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding()
            }
            
            Button("OK") {
                dismiss()
            }
            .padding()
        }
    }
}
