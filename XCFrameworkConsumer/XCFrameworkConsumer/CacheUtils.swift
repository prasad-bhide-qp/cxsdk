//
//  CacheUtils.swift
//  XCFrameworkConsumer
//
//  Created by Prasad on 09/10/25.
//

import Foundation

/// A utility class for saving, retrieving, and deleting simple cached data using UserDefaults.
final class CacheUtils {
    
    private static let defaults = UserDefaults.standard
    
    // MARK: - Save
    
    /// Saves a value to UserDefaults.
    /// - Parameters:
    ///   - value: The value to save (String, Int, Bool, etc.)
    ///   - key: The key used to store the value.
    static func save<T>(_ value: T, forKey key: String) {
        defaults.set(value, forKey: key)
    }
    
    // MARK: - Retrieve
    
    /// Retrieves a value from UserDefaults.
    /// - Parameter key: The key for the stored value.
    /// - Returns: The value if it exists, or `nil`.
    static func get<T>(forKey key: String) -> T? {
        return defaults.object(forKey: key) as? T
    }
    
    /// Retrieves a `String` value.
    static func getString(forKey key: String) -> String? {
        return defaults.string(forKey: key)
    }
    
    /// Retrieves an `Int` value.
    static func getInt(forKey key: String) -> Int {
        return defaults.integer(forKey: key)
    }
    
    /// Retrieves a `Bool` value.
    static func getBool(forKey key: String) -> Bool {
        return defaults.bool(forKey: key)
    }
    
    // MARK: - Remove
    
    /// Removes a stored value from UserDefaults.
    /// - Parameter key: The key to remove.
    static func remove(forKey key: String) {
        defaults.removeObject(forKey: key)
    }
    
    // MARK: - Codable Object Support
    
    /// Saves a codable object to UserDefaults.
    static func saveObject<T: Codable>(_ object: T, forKey key: String) {
        if let encoded = try? JSONEncoder().encode(object) {
            defaults.set(encoded, forKey: key)
        }
    }
    
    /// Retrieves a codable object from UserDefaults.
    static func getObject<T: Codable>(forKey key: String, type: T.Type) -> T? {
        guard let data = defaults.data(forKey: key),
              let decoded = try? JSONDecoder().decode(T.self, from: data) else {
            return nil
        }
        return decoded
    }
    
    // MARK: - Clear All
    
    /// Clears all UserDefaults data (use carefully).
    static func clearAll() {
        for (key, _) in defaults.dictionaryRepresentation() {
            defaults.removeObject(forKey: key)
        }
    }
    
    static func testUserDefaults() {
        // Save simple values
        save("John Doe", forKey: "username")
        save(30, forKey: "age")
        save(true, forKey: "isLoggedIn")
        
        // Retrieve and print values
        if let username = getString(forKey: "username") {
            print("Username:", username)
        }
        
        let age = getInt(forKey: "age")
        print("Age:", age)
        
        let isLoggedIn = getBool(forKey: "isLoggedIn")
        print("Is Logged In:", isLoggedIn)
    }
}
