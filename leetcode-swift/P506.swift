import XCTest


// O(nlog(n)) time. O(log(n)) space. Built-in sort.
class Solution {
    func findRelativeRanks(_ nums: [Int]) -> [String] {
        var result = [String](repeating: "", count: nums.count)

        nums.enumerated().sorted(by: { $0.1 > $1.1 }).enumerated().forEach { (rank, indexedNum) in
            var rankStr: String

            switch rank {
            case 0:
                rankStr = "Gold Medal"
            case 1:
                rankStr = "Silver Medal"
            case 2:
                rankStr = "Bronze Medal"
            default:
                rankStr = String(rank + 1)
            }

            result[indexedNum.0] = rankStr
        }

        return result
    }
}

class SolutionTest: XCTestCase {
    func testSolution() {
        let cases = [
            ([5, 4, 3, 2, 1], ["Gold Medal", "Silver Medal", "Bronze Medal", "4", "5"]),
        ]

        cases.forEach {
            let actual = Solution().findRelativeRanks($0)
            XCTAssertEqual($1, actual)
        }
    }
}
