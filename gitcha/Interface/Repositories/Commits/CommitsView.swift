import SwiftUI

/// A `CommitsView` shows a list of commits inside a List view.
/// On display of the commitsView the commits for a given repository are been loaded.
struct CommitsView: View {
    @ObservedObject private var task: ObservableTask<GetCommitsTask>
    private var title: String
    private var shouldLoadData: Bool = true
    
    init(for name: String) {
        self._task = .init(
            initialValue: ObservableTask(
                task: GetCommitsTask(for: Settings.username, repository: name)
            )
        )
        self.title = name
    }
    
    fileprivate init(for name: String, shouldLoadData: Bool) {
        self.init(for: name)
        self.shouldLoadData = shouldLoadData
    }
    
    var body: some View {
        VStack {
            if task.data == nil && task.error == nil {
                Text(LocalizedStringKey("status-loading"))
            } else {
                if task.error == nil {
                    List(
                        task.data?.sorted(
                            by: { $0.data.date > $1.data.date }
                        ) ?? [],
                        id: \.sha
                    ) { commit in
                        NavigationLink(destination: CommitWebView(url: commit.url)) {
                            CommitCell(commit: commit)
                        }
                        
                    }
                    
                } else {
                    Text(LocalizedStringKey("status-error"))
                }
            }
        }.onAppear() {
            if self.shouldLoadData {
                self.task.reload()
            }
        }.navigationBarTitle(title)
    }
}

struct CommitsView_Previews: PreviewProvider {
    static var previews: some View {
        CommitsView(for: "caffeine", shouldLoadData: false)
    }
}
