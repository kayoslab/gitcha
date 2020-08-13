import Foundation
import gitcha_networking

/// A task that can be used to retrieve a specific commit for a given user and repository.
public final class GetCommitsTask: JSONTask {
    public typealias SuccessType = [Commit]
    public typealias ErrorType = APIError

    public var request: Request

    /// Initialises the task with a given username and repository.
    ///
    /// - Parameter user: The username for which the repositories
    ///                   should be fetched by the application.
    /// - Parameter repository: The repostiory for which the
    ///                   list of commits should be fetched.
    public init(for user: String, repository: String) {
        self.request = CommitsRequests.getCommits(
            user: user,
            repository: repository
        )
    }
}
