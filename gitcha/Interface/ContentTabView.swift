import SwiftUI

/// A `TabView` that holds multiple tab items. In this way
/// the application can be easily extended.
struct ContentTabView: View {
    var body: some View {
        TabView() {
            RepositoriesView()
                .tabItem {
                    VStack {
                        Image(systemName: "clock")
                            .font(.system(size: 20.0))
                        Text("Repositories")
                    }
                }

            SettingsView()
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                            .font(.system(size: 20.0))
                        Text("Settings")
                    }
                }
        }
    }
}

/// Preview for the `ContentTabView`.
struct ContentTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentTabView()
    }
}
