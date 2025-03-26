import Testing
@testable import NetworkError

#if DEBUG
import XCTest

final class NetworkErrorTests: XCTestCase {

    func testInvalidURLReason() {
        let error = NetworkError.invalidURL()
        XCTAssertEqual(error.reason, "The URL provided was invalid.")
    }

    func testNoInternetReason() {
        let error = NetworkError.noInternet()
        XCTAssertEqual(error.reason, "No internet connection. Please check your network.")
    }

    func testNoResponseReason() {
        let error = NetworkError.noResponse()
        XCTAssertEqual(error.reason, "No response received from the server.")
    }

    func testBadStatusCodeReason() {
        let error = NetworkError.badStatusCode(statusCode: 404)
        XCTAssertEqual(error.reason, "Received an invalid response from the server. Status Code: 404")
    }

    func testDecodingFailedReason() {
        let error = NetworkError.decodingFailed()
        XCTAssertEqual(error.reason, "Failed to decode the response data.")
    }

    func testRequestTimeoutReason() {
        let error = NetworkError.requestTimeout()
        XCTAssertEqual(error.reason, "The request timed out. Please try again later.")
    }

    func testUnknownReason() {
        let sampleError = NSError(domain: "Test", code: 999, userInfo: [NSLocalizedDescriptionKey: "Something went wrong"])
        let error = NetworkError.unknown(sampleError)
        XCTAssertTrue(error.reason.contains("Something went wrong"))
    }

    func testBadStatusCodeDebugInfoWithData() {
        let jsonData = "{\"error\":\"Not Found\"}".data(using: .utf8)
        let error = NetworkError.badStatusCode(statusCode: 404, data: jsonData)
        XCTAssertTrue(error.debugInfo.contains("Not Found"))
    }

    func testBadStatusCodeDebugInfoWithoutData() {
        let error = NetworkError.badStatusCode(statusCode: 404, data: nil)
        XCTAssertEqual(error.debugInfo, "No response body.")
    }

    func testEquality() {
        let error1 = NetworkError.invalidURL()
        let error2 = NetworkError.invalidURL()
        XCTAssertEqual(error1, error2)
    }
}
#endif
