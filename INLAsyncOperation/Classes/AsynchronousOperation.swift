//  Copyright © 2018 Inloop, s.r.o. All rights reserved.

import Foundation

@objc enum OperationState: Int {
    case ready, executing, finished
}

/**
 The AsynchronousOperation

 Originally adopted from
 https://stackoverflow.com/questions/43561169/trying-to-understand-asynchronous-operation-subclass
 */
open class AsynchronousOperation: Operation {
    private let lockQueue = DispatchQueue(label: "operation.lock.queue", attributes: .concurrent)
    private var rawState = OperationState.ready
    private static let stateKeyPath = "state"
    @objc private dynamic var state: OperationState {
        set {
            willChangeValue(forKey: AsynchronousOperation.stateKeyPath)
            lockQueue.sync(flags: .barrier) {
                rawState = newValue
            }
            didChangeValue(forKey: AsynchronousOperation.stateKeyPath)
        } get {
            return lockQueue.sync { rawState }
        }
    }

    override open var isReady: Bool {
        return super.isReady && state == .ready
    }

    override open var isExecuting: Bool {
        return state == .executing
    }

    override open var isFinished: Bool {
        return state == .finished
    }

    override open var isAsynchronous: Bool {
        return true
    }

    /**
     Default start implementation.
     Checks if the operation is cancelled.
     If so, it finishes. Otherwise it starts the execution by calling main.
     */
    open override func start() {
        guard !isCancelled else {
            finish()
            return
        }

        state = .executing
        main()
    }

    /**
     The main function should execute the task you want
     to perform within the operation.
     It is designated to be overriden in subclasses.
     */
    open override func main() {
        fatalError("If you want to execute any task override main in subclass! Do not call super anytime!")
    }

    func finish() {
        state = .finished
    }

    // MARK: - NSObject

    @objc private dynamic class func keyPathsForValuesAffectingIsReady() -> Set<String> {
        return [AsynchronousOperation.stateKeyPath]
    }

    @objc private dynamic class func keyPathsForValuesAffectingIsExecuting() -> Set<String> {
        return [AsynchronousOperation.stateKeyPath]
    }

    @objc private dynamic class func keyPathsForValuesAffectingIsFinished() -> Set<String> {
        return [AsynchronousOperation.stateKeyPath]
    }
}
