import SwiftUI

/// A `RepositoriesView` shows a list of repositories inside a List view.
/// On display of the view the repositories for a given user are been loaded.
struct RepositoriesView: View {
    @ObservedObject private var task: ObservableTask<GetUserRepositoriesTask>
    private var shouldLoadData: Bool = true

    init() {
        self._task = .init(
            initialValue: ObservableTask(
                task: GetUserRepositoriesTask(for: Settings.username)
            )
        )
    }
    
    fileprivate init(shouldLoadData: Bool) {
        self.init()
        self.shouldLoadData = shouldLoadData
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if task.data == nil && task.error == nil {
                    Text(LocalizedStringKey("status-loading"))
                } else {
                    if task.error == nil {
                        List(
                            task.data?.sorted(
                                by: { $0.updatedAt > $1.updatedAt }
                            ) ?? [],
                            id: \.identifier
                        ) { repository in
                            NavigationLink(destination: CommitsView(for: repository.name)){
                                RepositoryCell(repository: repository)
                            }
                        }
                        
                    } else {
                        Text(LocalizedStringKey("status-error"))
                    }
                }
            }
            .navigationBarTitle(Text(LocalizedStringKey("title-repositories")))
        }.onAppear() {
            if self.shouldLoadData {
                self.task.reload()
            }
        }
    }
}

struct RepositoriesView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoriesView(shouldLoadData: false)
    }
}
