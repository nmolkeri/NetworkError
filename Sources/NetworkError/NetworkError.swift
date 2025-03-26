// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

public enum NetworkError: Error {
    case invalidURL
    case noInternet
    case noResponse
    case badStatusCode(statusCode: Int)
    case decodingFailed
    case requestTimeout
    case unknown(Error)

    var reason: String {
        switch self {
        case .invalidURL:
            return "The URL provided was invalid."
        case .noInternet:
            return "No internet connection. Please check your network."
        case .badStatusCode(let statusCode):
            return "Received an invalid response from the server. Status Code: \(statusCode)"
        case .decodingFailed:
            return "Failed to decode the response data."
        case .requestTimeout:
            return "The request timed out. Please try again later."
        case .unknown(let error):
            return "An unknown error occurred: \(error.localizedDescription)"
        case .noResponse:
            return "No response received"
        }
    }

    static public func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
      return lhs.reason == rhs.reason
    }
}
