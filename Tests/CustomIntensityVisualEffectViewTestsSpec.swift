import Quick
import Nimble
import EarlGrey
@testable import CustomIntensityVisualEffectViewDemoApp

class CustomIntensityVisualEffectViewSpec: QuickSpec {

    override func spec() {
        describe("View") {
            beforeEach {
                GREYUIThreadExecutor.sharedInstance().drainUntilIdle()
            }

            it("should be visible") {
                EarlGrey.select(elementWithMatcher: grey_kindOfClass(View.self))
                    .assert(grey_sufficientlyVisible())
            }
        }
    }

}
