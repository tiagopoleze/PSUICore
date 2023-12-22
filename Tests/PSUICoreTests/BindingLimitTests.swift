import XCTest
@testable import PSUICore

class BindingLimitTests: XCTestCase {
    func testExample() {
        XCTAssertTrue(true)
    }
    
    func testBindingLimit() {
        var text = "Hello, World!"
        let binding = Binding<String>(get: { text }, set: { text = $0 })
        
        let limitedBinding = binding.limit(5)
        
        XCTAssertEqual(limitedBinding.wrappedValue, "Hello")
        
        limitedBinding.wrappedValue = "Hi"
        XCTAssertEqual(limitedBinding.wrappedValue, "Hi")
        
        limitedBinding.wrappedValue = "Hello, World!"
        XCTAssertEqual(limitedBinding.wrappedValue, "Hello")
    }
}