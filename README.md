# INLAsyncOperation

## Requirements
* iOS 9.0+

## Installation

INLAsyncOperation is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'INLAsyncOperation'
```

## Usage

1. run `pod install` in your repository
2. `import INLAsyncOperation`
3. Subclass `AsynchronousOperation`
4. Override `main()`
5. Put your task implementation in `main()` of your custom class

See the example `INLAsyncOperationExample` as a reference.

```swift
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            let array = [String](repeating: "🎉", count: 100)
            self.completion(array)
        }
    }
}
```

## Author

radimhalfar, radim.halfar@inloop.eu

## License

INLAsyncOperation is available under the MIT license. See the LICENSE file for more info.
