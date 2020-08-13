import SwiftUI
import WebKit

/// A slim webview implementation using `WebKit` to display commit details in a webview.
struct CommitWebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: url))
    }
}

struct CommitWebView_Previews: PreviewProvider {
    static var previews: some View {
        let url = URL(string: "https://github.com/kayoslab/caffeine/commit/61416d586cc4d0b568f6fe254188b34074616f7b")!
        return CommitWebView(url: url)
    }
}
