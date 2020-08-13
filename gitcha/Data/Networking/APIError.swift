import Foundation

public struct APIError: Decodable {
    /// The error message
    var message: String?
    /// The underlying error objects
    var errors: [String: String]?
}
