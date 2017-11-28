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
        setupSegmentedControls()
        setupSliderView()
        updateSegmentedControls()
        updateSlider()
        updateVisualEffect()
    }

    private var demoView: View! {
        return view as? View
    }

    private var blurEffectStyle: UIBlurEffectStyle? = .dark {
        didSet {
            updateSegmentedControls()
            updateVisualEffect()
        }
    }

    private var effectIntensity: CGFloat = 0.5 {
        didSet {
            updateSlider()
            updateVisualEffect()
        }
    }

    private func setupSegmentedControls() {
        demoView.firstSegmentedControl.insertSegment(withTitle: "extra light", at: 0, animated: false)
        demoView.firstSegmentedControl.insertSegment(withTitle: "light", at: 1, animated: false)
        demoView.firstSegmentedControl.insertSegment(withTitle: "dark", at: 2, animated: false)
        demoView.secondSegmentedControl.insertSegment(withTitle: "regular", at: 0, animated: false)
        demoView.secondSegmentedControl.insertSegment(withTitle: "prominent", at: 1, animated: false)
        demoView.firstSegmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        demoView.secondSegmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
    }

    private func setupSliderView() {
        demoView.slider.value = Float(demoView.visualEffectView.intensity)
        demoView.slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
    }

    private func updateVisualEffect() {
        if let style = blurEffectStyle {
            demoView.visualEffectView.effect = UIBlurEffect(style: style)
        } else {
            demoView.visualEffectView.effect = nil
        }
        demoView.visualEffectView.intensity = effectIntensity
    }

    private func updateSlider() {
        demoView.slider.value = Float(effectIntensity)
    }

    private func updateSegmentedControls() {
        switch blurEffectStyle {
        case .some(.extraLight):
            demoView.firstSegmentedControl.selectedSegmentIndex = 0
            demoView.secondSegmentedControl.selectedSegmentIndex = UISegmentedControlNoSegment
        case .some(.light):
            demoView.firstSegmentedControl.selectedSegmentIndex = 1
            demoView.secondSegmentedControl.selectedSegmentIndex = UISegmentedControlNoSegment
        case .some(.dark):
            demoView.firstSegmentedControl.selectedSegmentIndex = 2
            demoView.secondSegmentedControl.selectedSegmentIndex = UISegmentedControlNoSegment
        case .some(.regular):
            demoView.firstSegmentedControl.selectedSegmentIndex = UISegmentedControlNoSegment
            demoView.secondSegmentedControl.selectedSegmentIndex = 0
        case .some(.prominent):
            demoView.firstSegmentedControl.selectedSegmentIndex = UISegmentedControlNoSegment
            demoView.secondSegmentedControl.selectedSegmentIndex = 1
        default:
            demoView.firstSegmentedControl.selectedSegmentIndex = UISegmentedControlNoSegment
            demoView.secondSegmentedControl.selectedSegmentIndex = UISegmentedControlNoSegment
        }
    }

    // MARK: UI events

    @objc func sliderValueChanged(_ slider: UISlider) {
        effectIntensity = CGFloat(slider.value)
    }

    @objc func segmentedControlValueChanged(_ control: UISegmentedControl) {
        switch (control, control.selectedSegmentIndex) {
        case (demoView.firstSegmentedControl, 0):
            blurEffectStyle = .extraLight
        case (demoView.firstSegmentedControl, 1):
            blurEffectStyle = .light
        case (demoView.firstSegmentedControl, 2):
            blurEffectStyle = .dark
        case (demoView.secondSegmentedControl, 0):
            blurEffectStyle = .regular
        case (demoView.secondSegmentedControl, 1):
            blurEffectStyle = .prominent
        default:
            blurEffectStyle = nil
        }
    }

}
