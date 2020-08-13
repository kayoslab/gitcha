import Foundation

let defaults = UserDefaults(suiteName: "gitcha")

/// A Property wrapper around UserDefaults which makes it easier to interact with.
@propertyWrapper struct UserDefault<T> {
    
    /// The key of the entry which should be added to the defaults.
    let key: String

    
    /// Initialises a new entry.
    ///
    /// - Parameter key: The key of the entry.
    init(_ key: String) {
        self.key = key
    }

    /// The actual value retrieved from the defults.
    var wrappedValue: T? {
        get {
            return defaults?.object(forKey: key) as? T
        }
        set {
            defaults?.set(newValue, forKey: key)
        }
    }
}

struct Settings {
    // swiftlint:disable let_var_whitespace
    @UserDefault("gitcha.username")
    private static var storedUsername: String?

    // swiftlint:enable let_var_whitespace
    static var username: String {
        get {
            return Settings.storedUsername ?? "kayoslab"
        }
        set {
            Settings.storedUsername = newValue
        }
    }
}
