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
        demoView.firstEffectSegmentedControl.insertSegment(withTitle: "extra light", at: 0, animated: false)
        demoView.firstEffectSegmentedControl.insertSegment(withTitle: "light", at: 1, animated: false)
        demoView.firstEffectSegmentedControl.insertSegment(withTitle: "dark", at: 2, animated: false)
        demoView.secondEffectSegmentedControl.insertSegment(withTitle: "regular", at: 0, animated: false)
        demoView.secondEffectSegmentedControl.insertSegment(withTitle: "prominent", at: 1, animated: false)
        demoView.firstEffectSegmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        demoView.secondEffectSegmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
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
            demoView.firstEffectSegmentedControl.selectedSegmentIndex = 0
            demoView.secondEffectSegmentedControl.selectedSegmentIndex = UISegmentedControlNoSegment
        case .some(.light):
            demoView.firstEffectSegmentedControl.selectedSegmentIndex = 1
            demoView.secondEffectSegmentedControl.selectedSegmentIndex = UISegmentedControlNoSegment
        case .some(.dark):
            demoView.firstEffectSegmentedControl.selectedSegmentIndex = 2
            demoView.secondEffectSegmentedControl.selectedSegmentIndex = UISegmentedControlNoSegment
        case .some(.regular):
            demoView.firstEffectSegmentedControl.selectedSegmentIndex = UISegmentedControlNoSegment
            demoView.secondEffectSegmentedControl.selectedSegmentIndex = 0
        case .some(.prominent):
            demoView.firstEffectSegmentedControl.selectedSegmentIndex = UISegmentedControlNoSegment
            demoView.secondEffectSegmentedControl.selectedSegmentIndex = 1
        default:
            demoView.firstEffectSegmentedControl.selectedSegmentIndex = UISegmentedControlNoSegment
            demoView.secondEffectSegmentedControl.selectedSegmentIndex = UISegmentedControlNoSegment
        }
    }

    // MARK: UI events

    @objc func sliderValueChanged(_ slider: UISlider) {
        effectIntensity = CGFloat(slider.value)
    }

    @objc func segmentedControlValueChanged(_ control: UISegmentedControl) {
        switch (control, control.selectedSegmentIndex) {
        case (demoView.firstEffectSegmentedControl, 0):
            blurEffectStyle = .extraLight
        case (demoView.firstEffectSegmentedControl, 1):
            blurEffectStyle = .light
        case (demoView.firstEffectSegmentedControl, 2):
            blurEffectStyle = .dark
        case (demoView.secondEffectSegmentedControl, 0):
            blurEffectStyle = .regular
        case (demoView.secondEffectSegmentedControl, 1):
            blurEffectStyle = .prominent
        default:
            blurEffectStyle = nil
        }
    }

}
