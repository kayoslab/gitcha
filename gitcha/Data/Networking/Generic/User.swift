import Foundation

/// A `User` is a github specific decodable data model, which is used by multiple
/// APIs. This model can be used to retrieve user specific information.
struct User: Decodable {
    var identifier: Int
    var nodeId: String
    var name: String
    var avatarUrl: URL
    var profileUrl: URL
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case nodeId = "node_id"
        case name = "login"
        case avatarUrl = "avatar_url"
        case profileUrl = "url"
    }
}
