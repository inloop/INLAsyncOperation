//  Copyright © 2018 Inloop, s.r.o. All rights reserved.

import UIKit

final class ExampleController: UIViewController {
    @IBOutlet weak var exampleLabel: UILabel!
    private let operationDispatcher = OperationDispatcher()
    override func viewDidLoad() {
        super.viewDidLoad()
        let operation = SampleOperation { (result) in
            self.exampleLabel.text = result.joined(separator: " - ")
        }
        operationDispatcher.dispatch(operation)
    }
}

