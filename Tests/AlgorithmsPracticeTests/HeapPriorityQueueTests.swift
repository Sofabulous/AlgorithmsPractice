//
//  HeapPriorityQueueTests.swift
//  
//
//  Created by YuKun on 7.12.21.
//

import XCTest
@testable import AlgorithmsPractice

final class HeapPriorityQueueTests: XCTestCase {
    func testAddData() {
        let queue = HeapPriorityQueue<Int>()
        queue.add(3)
        queue.add(1)
        queue.add(2)
        assert(queue.peek() != nil && queue.peek()! == 1)
    }

    func testRemoveData() {
        let queue = HeapPriorityQueue<Int>()
        queue.add(3)
        queue.add(1)
        queue.add(2)
        let _ = try? queue.remove()
        assert(queue.peek() != nil && queue.peek()! == 2)
        let _ = try? queue.remove()
        let data1 = try? queue.remove()
        let data2 = try? queue.remove()
        assert(data1 == 3 && data2 == nil)
    }

    func testPopData() {
        let queue = HeapPriorityQueue<Int>()
        queue.add(6)
        queue.add(7)
        queue.add(5)
        let data1 = queue.dequeue()
        let data2 = queue.dequeue()
        let data3 = queue.dequeue()
        assert(data1 == 5 && data2 == 6 && data3 == 7)
        assert(queue.dequeue() == nil)
    }

    func testClearData() {
        let queue = HeapPriorityQueue<Int>()
        queue.add(6)
        queue.add(7)
        queue.add(5)
        queue.clear()
        assert(queue.peek() == nil)
    }

    func testAddDataPerformance() {
        let queue = HeapPriorityQueue<Int>()
        var nums = [Int]()
        for _ in 0..<10000 {
            nums.append(Int.random(in: 0..<10000))
        }
        self.measure {
            for i in 0..<10000 {
                queue.add(nums[i])
            }
        }
    }

}
