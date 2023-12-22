import XCTest
@testable import PSUICore
import AVFoundation

class MediaTypeAccessRequesterTests: XCTestCase {
    func testMediaTypeAccessRequester() {
        let expectation = XCTestExpectation(description: "Media type access request expectation")
        
        let finishAction = {
            expectation.fulfill()
        }
        
        let errorAction = {
            XCTFail("Access request should not fail")
        }
        
        let mediaTypeAccessRequester = MediaTypeAccessRequester(finishAction: finishAction, errorAction: errorAction)
        mediaTypeAccessRequester.request(types: [.video, .audio])
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    #if os(iOS)
    func testMediaTypeAccessRequesterWithNavigationController() {
        let expectation = XCTestExpectation(description: "Media type access request expectation")
        
        let navigationController = UINavigationController()
        
        let finishAction = {
            expectation.fulfill()
        }
        
        let mediaTypeAccessRequester = MediaTypeAccessRequester(navigationController: navigationController, finishAction: finishAction)
        mediaTypeAccessRequester.request(types: [.video, .audio])
        
        wait(for: [expectation], timeout: 5.0)
    }
    #endif
}
