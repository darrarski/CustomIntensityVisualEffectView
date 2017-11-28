import UIKit

/// Visual effect view with given effect and its intensity
public class CustomIntensityVisualEffectView: UIView {

    /// Create visual effect view with given effect and its intensity
    ///
    /// - Parameters:
    ///   - effect: visual effect, eg UIBlurEffect(style: .dark)
    ///   - intensity: custom intensity from 0.0 (no effect) to 1.0 (full effect) using linear scale
    public init(effect: UIVisualEffect?, intensity: CGFloat) {
        self.effect = effect
        self.intensity = intensity
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
        updateAnimator()
    }

    /// Init with coder not supported
    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    /// Visual effect, eg UIBlurEffect(style: .dark)
    public var effect: UIVisualEffect? {
        didSet { updateAnimator() }
    }

    /// Intensity of visual effect from 0.0 (no effect) to 1.0 (full effect) using linear scale
    public var intensity: CGFloat = 1 {
        didSet { animator?.fractionComplete = intensity }
    }

    // MARK: Subviews

    private let visualEffectView = UIVisualEffectView(effect: nil)

    private func addSubviews() {
        addSubview(visualEffectView)
    }

    // MARK: Layout

    private func setupLayout() {
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        visualEffectView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        visualEffectView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    // MARK: Animator

    private var animator: UIViewPropertyAnimator? {
        didSet { oldValue?.stopAnimation(true) }
    }

    private func updateAnimator() {
        visualEffectView.effect = nil
        animator = UIViewPropertyAnimator(duration: 1, curve: .linear) { [unowned self] in
            self.visualEffectView.effect = self.effect
        }
        animator?.fractionComplete = intensity
    }

}
