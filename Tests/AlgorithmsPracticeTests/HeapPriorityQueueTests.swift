//
//  HeapPriorityQueueTests.swift
//  
//
//  Created by YuKun on 7.12.21.
//

import XCTest
@testable import AlgorithmsPractice

final class HeapPriorityQueueTests: XCTestCase {
    func testAddDataMinHeap() {
        let queue = HeapPriorityQueue<Int>()
        queue.add(3)
        queue.add(1)
        queue.add(2)
        assert(queue.peek() != nil && queue.peek()! == 1)
    }
    
    func testAddDataMaxHeap() {
        let queue = HeapPriorityQueue<Int>(heapType: .MaxHeap)
        queue.add(3)
        queue.add(1)
        queue.add(2)
        assert(queue.peek() != nil && queue.peek()! == 3)
    }

    func testRemoveDataMinHeap() {
        let queue = HeapPriorityQueue<Int>()
        queue.add(2)
        queue.add(5)
        queue.add(6)
        queue.add(7)
        let _ = try? queue.remove()
        assert(queue.peek() != nil && queue.peek()! == 5)
        let _ = try? queue.remove()
        let _ = try? queue.remove()
        let data1 = try? queue.remove()
        let data2 = try? queue.remove()
        assert(data1 == 7 && data2 == nil)
    }
    
    func testRemoveDataMaxHeap() {
        let queue = HeapPriorityQueue<Int>(heapType: .MaxHeap)
        queue.add(2)
        queue.add(5)
        queue.add(6)
        queue.add(7)
        let _ = try? queue.remove()
        assert(queue.peek() != nil && queue.peek()! == 6)
        let _ = try? queue.remove()
        let _ = try? queue.remove()
        let data1 = try? queue.remove()
        let data2 = try? queue.remove()
        assert(data1 == 2 && data2 == nil)
    }

    func testPopDataMinHeap() {
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
    
    func testPopDataMaxHeap() {
        let queue = HeapPriorityQueue<Int>(heapType: .MaxHeap)
        queue.add(6)
        queue.add(7)
        queue.add(5)
        let data1 = queue.dequeue()
        let data2 = queue.dequeue()
        let data3 = queue.dequeue()
        assert(data1 == 7 && data2 == 6 && data3 == 5)
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
    
    func testAddDataTheWorstPerformanceMinHeap() {
        let queue = HeapPriorityQueue<Int>()
        self.measure {
            for i in (0..<10000).reversed() {
                queue.add(i)
            }
        }
    }

}
