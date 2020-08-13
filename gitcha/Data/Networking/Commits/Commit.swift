import Foundation

/// A light representation of the commit response model defined by the github api standard.
/// This model is incomplete by design. The API supports multiple other parameters which can
/// be found in the README.md file
public struct Commit: Decodable {
    var sha: String
    
    var shortSha: String {
        return .init(sha.prefix(7))
    }
    
    var nodeId: String
    var url: URL
    
    var data: CommitData
    var author: User?
    var committer: User?
    
    enum CodingKeys: String, CodingKey {
        case sha
        case nodeId = "node_id"
        case url
        case data = "commit"
        case author
        case committer
    }
}

public struct CommitData: Decodable {
    var message: String
    var url: URL
    
    var name: String {
        return committer.name
    }
    var date: Date {
        return committer.date
    }
    
    private var committer: CommitAuthor
    private var author: CommitAuthor?
    
    enum CodingKeys: String, CodingKey {
        case message
        case url
        case committer
        case author
    }
}

private struct CommitAuthor: Decodable {
    var name: String
    var email: String?
    var date: Date
}
