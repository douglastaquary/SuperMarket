import XCTest
@testable import SuperMarket

final class SuperMarketTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SuperMarket().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
