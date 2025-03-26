// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

public enum NetworkError: Error, Equatable {
    case invalidURL(description: String? = nil)
    case noInternet(description: String? = nil)
    case noResponse(description: String? = nil)
    case badStatusCode(statusCode: Int, data: Data? = nil)
    case decodingFailed(underlying: Error? = nil)
    case requestTimeout(description: String? = nil)
    case unknown(Error)

    public var reason: String {
        switch self {
        case .invalidURL(let description):
            return description ?? "The URL provided was invalid."
        case .noInternet(let description):
            return description ?? "No internet connection. Please check your network."
        case .noResponse(let description):
            return description ?? "No response received from the server."
        case .badStatusCode(let statusCode, _):
            return "Received an invalid response from the server. Status Code: \(statusCode)"
        case .decodingFailed(let underlying):
            return "Failed to decode the response data." + (underlying != nil ? " Underlying error: \(underlying!.localizedDescription)" : "")
        case .requestTimeout(let description):
            return description ?? "The request timed out. Please try again later."
        case .unknown(let error):
            return "An unknown error occurred: \(error.localizedDescription)"
        }
    }

    public static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        return lhs.reason == rhs.reason
    }

    public var debugInfo: String {
        switch self {
        case .badStatusCode(_, let data):
            if let data = data, let responseString = String(data: data, encoding: .utf8) {
                return "Response Body: \(responseString)"
            } else {
                return "No response body."
            }
        case .decodingFailed(let underlying):
            return "Underlying Error: \(String(describing: underlying))"
        case .unknown(let error):
            return "Unknown Error: \(error)"
        default:
            return ""
        }
    }
}

