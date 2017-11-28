import UIKit

class ViewController: UIViewController {

    enum ContentStyle {
        case light
        case dark
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        switch contentStyle {
        case .light: return .default
        case .dark: return .lightContent
        }
    }

    // MARK: View

    override func loadView() {
        view = View()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupContent()
        setupSegmentedControls()
        setupSliderView()
        updateContent()
        updateVisualEffect()
        updateContentSegmentedControl()
        updateEffectSegmentedControls()
        updateSlider()
    }

    private var demoView: View! {
        return view as? View
    }

    private var contentStyle: ContentStyle = .light {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
            updateContentSegmentedControl()
            updateContent()
        }
    }

    private var blurEffectStyle: UIBlurEffectStyle? {
        didSet {
            updateEffectSegmentedControls()
            updateVisualEffect()
        }
    }

    private var effectIntensity: CGFloat = 0 {
        didSet {
            updateSlider()
            updateVisualEffect()
        }
    }

    private func setupContent() {
        let text = NSMutableAttributedString()
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = 10
        text.append(NSAttributedString(string: "CustomIntensityVisualEffectView Demo\n", attributes: [
            .font: UIFont.preferredFont(forTextStyle: .headline),
            .paragraphStyle: paragraphStyle
        ]))
        text.append(NSAttributedString(string: "Use buttons and slider below to customise look", attributes: [
            .font: UIFont.preferredFont(forTextStyle: .subheadline),
            .paragraphStyle: paragraphStyle
        ]))
        demoView.textLabel.attributedText = text
    }

    private func setupSegmentedControls() {
        demoView.contentSegmentedControl.insertSegment(withTitle: "light content", at: 0, animated: false)
        demoView.contentSegmentedControl.insertSegment(withTitle: "dark content", at: 1, animated: false)
        demoView.firstEffectSegmentedControl.insertSegment(withTitle: "extra light", at: 0, animated: false)
        demoView.firstEffectSegmentedControl.insertSegment(withTitle: "light", at: 1, animated: false)
        demoView.firstEffectSegmentedControl.insertSegment(withTitle: "dark", at: 2, animated: false)
        demoView.secondEffectSegmentedControl.insertSegment(withTitle: "regular", at: 0, animated: false)
        demoView.secondEffectSegmentedControl.insertSegment(withTitle: "prominent", at: 1, animated: false)
        demoView.contentSegmentedControl.addTarget(self, action: #selector(contentSegmentedControlValueChanged(_:)), for: .valueChanged)
        demoView.firstEffectSegmentedControl.addTarget(self, action: #selector(effectSegmentedControlValueChanged), for: .valueChanged)
        demoView.secondEffectSegmentedControl.addTarget(self, action: #selector(effectSegmentedControlValueChanged), for: .valueChanged)
    }

    private func setupSliderView() {
        demoView.slider.value = Float(demoView.visualEffectView.intensity)
        demoView.slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
    }

    private func updateContent() {
        switch contentStyle {
        case .light:
            demoView.contentView.backgroundColor = .white
            demoView.textLabel.textColor = .black
        case .dark:
            demoView.contentView.backgroundColor = .black
            demoView.textLabel.textColor = .white
        }
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

    private func updateContentSegmentedControl() {
        switch contentStyle {
        case .light: demoView.contentSegmentedControl.selectedSegmentIndex = 0
        case .dark: demoView.contentSegmentedControl.selectedSegmentIndex = 1
        }
    }

    private func updateEffectSegmentedControls() {
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

    @objc func contentSegmentedControlValueChanged(_ control: UISegmentedControl) {
        switch control.selectedSegmentIndex {
        case 0: contentStyle = .light
        case 1: contentStyle = .dark
        default: break
        }
    }

    @objc func effectSegmentedControlValueChanged(_ control: UISegmentedControl) {
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
