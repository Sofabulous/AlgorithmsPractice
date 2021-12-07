print("Hello, world!")
var queue = HeapPriorityQueue<Int>(heapType: .MaxHeap)
queue.add(3)
queue.add(2)
queue.add(1)
print(queue.peek()!)

