import Foundation
import gitcha_networking

/// A group of possible requests related to the Repositories.
/// These might behave differently based on whether a user is
/// signed in or not (future). Please check the `requiredAuthorization`
/// value to get details on this.
enum RepositoryRequests: Request {
    case getRepositories
    case getUserRepositories(user: String)

    var urlpath: String {
        switch self {
        case .getRepositories:
            return "https://api.github.com/user/repos"
        case .getUserRepositories(let user):
            return "https://api.github.com/users/\(user)/repos"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getRepositories, .getUserRepositories:
            return .get
        }
    }

    var parameters: RequestParams {
        return .empty
    }

    var headers: [String: String]? {
        return [:]
    }

    var dataType: DataType {
        return .json
    }

    var requiredAuthorization: Authorization {
        switch self {
        case .getRepositories:
            return .accessToken
        case .getUserRepositories:
            return .none
        }
    }
}

