import Foundation
import gitcha_networking

/// A task that can be used to retrieve the current user which is signed in.
/// This task will require an access token to be present.
public final class GetRepositoriesTask: JSONTask {
    public typealias SuccessType = [Repository]
    public typealias ErrorType = APIError

    public var request: Request

    public init() {
        self.request = RepositoryRequests.getRepositories
    }
}

/// A task that can be used to retrieve a specific user.
public final class GetUserRepositoriesTask: JSONTask {
    public typealias SuccessType = [Repository]
    public typealias ErrorType = APIError

    public var request: Request

    /// Initialises the task with a given username.
    ///
    /// - Parameter user: The username for which the repositories
    ///                   should be fetched by the application.
    public init(for user: String) {
        self.request = RepositoryRequests.getUserRepositories(user: user)
    }
}
