//  Copyright © 2018 Inloop, s.r.o. All rights reserved.

import Foundation
import INLAsyncOperation

struct OperationDispatcher {
    private let queue = OperationQueue()

    func dispatch(_ operation: Operation) {
        queue.addOperation(operation)
    }
}

final class SampleOperation: AsynchronousOperation {
    typealias CompletionClosure = (_ emojis: [String]) -> Void

    private let completion: CompletionClosure

    init(completion: @escaping CompletionClosure) {
        self.completion = completion
    }

    override func main() {
        // Just a sample
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            let array = [String](repeating: "🎉", count: 100)
            self.completion(array)
        }
    }
}
