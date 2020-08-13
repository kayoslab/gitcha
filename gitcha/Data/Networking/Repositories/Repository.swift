import Foundation

/// A light representation of the repository response model defined by the github api standard.
/// This model is incomplete by design. The API supports multiple other parameters which can
/// be found in the README.md file
public struct Repository: Decodable {
    var identifier: Int
    var nodeId: String
    var name: String
    var owner: User
    var description: String?
    var fork: Bool
    var repositoryUrl: URL
    var forksCount: Int
    var stargazersCount: Int
    var watchersCount: Int
    var openIssuesCount: Int
    var defaultBranch: String
    var size: Int
    var hasIssues: Bool
    var hasWiki: Bool
    var pushedAt: Date?
    var createdAt: Date
    var updatedAt: Date
    var license: License?
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case nodeId = "node_id"
        case name
        case owner
        case description
        case fork
        case repositoryUrl = "url"
        case forksCount = "forks_count"
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case openIssuesCount = "open_issues_count"
        case defaultBranch = "default_branch"
        case size
        case hasIssues = "has_issues"
        case hasWiki = "has_wiki"
        case pushedAt = "pushed_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case license
    }
}

struct License: Decodable {
    var key: String
    var name: String
    var url: URL?
    
    enum CodingKeys: String, CodingKey {
        case key
        case name
        case url
    }
}
