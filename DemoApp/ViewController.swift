import UIKit

class ViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: View

    override func loadView() {
        view = View()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVisualEffectView()
        setupSliderView()
    }

    private var demoView: View! {
        return view as? View
    }

    private func setupVisualEffectView() {
        demoView.visualEffectView.effect = UIBlurEffect(style: .dark)
        demoView.visualEffectView.intensity = 0.5
    }

    private func setupSliderView() {
        demoView.slider.value = Float(demoView.visualEffectView.intensity)
        demoView.slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
    }

    // MARK: UI events

    @objc func sliderValueChanged(_ slider: UISlider) {
        demoView.visualEffectView.intensity = CGFloat(slider.value)
    }

}
