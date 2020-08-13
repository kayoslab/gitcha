import SwiftUI

struct SettingsView: View {
    private let entries: [SettingsEntry] = [.init(name: "Username", data: { Settings.username })]
    
    var body: some View {
        NavigationView {
            List(
                entries,
                id: \.name
            ) { entry in
                Text("\(entry.name): \(entry.data())")
            }
            .navigationBarTitle(Text(LocalizedStringKey("title-settings")))
        }
    }
}

struct SettingsEntry {
    var name: String
    var data: () -> String
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
