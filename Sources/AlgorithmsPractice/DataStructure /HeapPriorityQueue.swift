//
//  heapPriorityQueue.swift
//  AlgorithmsPractice
//
//  Created by YuKun on 6.12.21.
//

import Foundation

enum QueueError: Error {
  case noSuchItem(String)
}

enum HeapType {
    case MinHeap
    case MaxHeap
}

class HeapPriorityQueue<DataType: Comparable> {

    /// 队列的存储
    private var queue: Array<DataType>

    /// 队列的大小
    public var size: Int {
        return self.queue.count
    }
        
    public let heapType:HeapType
    
    private let compare:(DataType, DataType) -> Bool
        
    public init(heapType:HeapType = .MinHeap) {
        self.heapType = heapType
        switch heapType {
        case .MinHeap:
            compare = (>)
        case .MaxHeap:
            compare = (<)
        }
        self.queue = Array<DataType>()
    }
}


private extension Int {
    var leftChild: Int {
        return (2 * self) + 1
    }

    var rightChild: Int {
        return (2 * self) + 2
    }

    var parent:Int {
        return (self - 1) / 2
    }
}

extension HeapPriorityQueue: Queue {

    @discardableResult
    public func add(_ item: DataType) -> Bool {
        self.queue.append(item)
        self.heapifyUp(from: self.queue.count - 1)
        return true
    }

    @discardableResult
    public func remove() throws -> DataType {
        guard self.queue.count > 0 else {
            throw QueueError.noSuchItem("Attempt to remove item from an empty queue")
        }
        return self.popAndHeapifyDown()
    }

    public func dequeue() -> DataType? {
        guard self.queue.count > 0 else {
            return nil
        }
        return self.popAndHeapifyDown()
    }

    public func peek() -> DataType? {
        self.queue.first
    }

    public func clear() {
        self.queue.removeAll()
    }

    /**
     通过将元素移向队头的方式恢复最小堆排序。
     - 参数 index: 要移动的元素的索引值。
     */
    private func heapifyUp(from index: Int) {
        if (index >= queue.count) {
            fatalError("index for heapifyUp is out the border")
        }
        var child = index
        var parent = index.parent
        
        while parent >= 0 && compare(self.queue[parent], self.queue[child]) {
            self.swap(parent, with: child)
            child = parent
            parent = child.parent
        }
    }

    /**
     通过将根元素移向队尾的方式恢复队列的最小堆排序。
     */
    private func heapifyDown() {
        var parent = 0

        while true {
            let leftChild = parent.leftChild
            if leftChild >= self.queue.count {
                break
            }

            let rightChild = parent.rightChild
            var correctChild = leftChild
            
            if rightChild < self.queue.count && compare(self.queue[correctChild], self.queue[rightChild]) {
                correctChild = rightChild
            }

            if compare(self.queue[parent], self.queue[correctChild]) {
                self.swap(parent, with: correctChild)
                parent = correctChild
            } else {
                break
            }
        }
    }

    /**
    弹出队列中的第一个元素，并通过将根元素移向队尾的方式恢复最小堆排序。
    - 返回值: 队列中的第一个元素。
    */
    private func popAndHeapifyDown() -> DataType {
        let firstItem = self.queue[0]

        if (self.queue.count == 1) {
            self.queue.remove(at: 0)
            return firstItem
        }

        self.queue[0] = self.queue.remove(at: self.queue.count - 1)

        self.heapifyDown()

        return firstItem
    }

    /**
     交换存储中位于两处索引值位置的元素。
     - 参数 firstIndex：第一个要交换元素的索引。
     - 参数 secondIndex：第二个要交换元素的索引。
     */
    private func swap(_ firstIndex: Int, with secondIndex: Int) {
      let firstItem = self.queue[firstIndex]
      self.queue[firstIndex] = self.queue[secondIndex]
      self.queue[secondIndex] = firstItem
    }
}

extension HeapPriorityQueue: CustomStringConvertible {
    public var description: String {
        return self.queue.description
    }
}
