import Foundation
import gitcha_networking

/// A group of possible requests related to the Commits.
enum CommitsRequests: Request {
    case getCommits(user: String, repository: String)

    var urlpath: String {
        switch self {
        case .getCommits(let user, let repository):
            return "https://api.github.com/repos/\(user)/\(repository)/commits"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getCommits:
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
        case .getCommits:
            return .none
        }
    }
}

