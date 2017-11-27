import UIKit

class ViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // View

    override func loadView() {
        view = UIView(frame: .zero)
        view.backgroundColor = .white
    }

}
