import UIKit
import CustomIntensityVisualEffectView

class View: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: Subviews

    let contentView = UIView(frame: .zero)
    let imageView = Subview.imageView
    let textLabel = Subview.textLabel
    let visualEffectView = Subview.visualEffectView
    let configView = Subview.configView
    let contentLabel = Subview.configLabel
    let contentSegmentedControl = UISegmentedControl(items: [])
    let effectLabel = Subview.configLabel
    let firstEffectSegmentedControl = UISegmentedControl(items: [])
    let secondEffectSegmentedControl = UISegmentedControl(items: [])
    let sliderLabel = Subview.configLabel
    let slider = Subview.slider

    private func addSubviews() {
        addSubview(contentView)
        contentView.addSubview(textLabel)
        contentView.addSubview(imageView)
        contentView.addSubview(visualEffectView)
        addSubview(configView)
        configView.addSubview(contentLabel)
        configView.addSubview(contentSegmentedControl)
        configView.addSubview(effectLabel)
        configView.addSubview(firstEffectSegmentedControl)
        configView.addSubview(secondEffectSegmentedControl)
        configView.addSubview(sliderLabel)
        configView.addSubview(slider)
    }

    // MARK: Layout

    private func setupLayout() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.67).isActive = true
        imageView.topAnchor.constraintEqualToSystemSpacingBelow(contentView.topAnchor, multiplier: 4).isActive = true
        imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true

        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.topAnchor.constraintEqualToSystemSpacingBelow(imageView.bottomAnchor, multiplier: 2).isActive = true
        textLabel.leftAnchor.constraintEqualToSystemSpacingAfter(contentView.leftAnchor, multiplier: 2).isActive = true
        contentView.rightAnchor.constraintGreaterThanOrEqualToSystemSpacingAfter(textLabel.rightAnchor, multiplier: 2).isActive = true
        contentView.bottomAnchor.constraintGreaterThanOrEqualToSystemSpacingBelow(textLabel.bottomAnchor, multiplier: 2).isActive = true
        textLabel.setContentCompressionResistancePriority(.defaultLow, for: .vertical)

        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        visualEffectView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        visualEffectView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        configView.translatesAutoresizingMaskIntoConstraints = false
        configView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        configView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        configView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.topAnchor.constraintEqualToSystemSpacingBelow(configView.topAnchor, multiplier: 2).isActive = true
        contentLabel.leftAnchor.constraintEqualToSystemSpacingAfter(configView.leftAnchor, multiplier: 2).isActive = true
        configView.rightAnchor.constraintGreaterThanOrEqualToSystemSpacingAfter(contentLabel.rightAnchor, multiplier: 2).isActive = true

        contentSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        contentSegmentedControl.topAnchor.constraintEqualToSystemSpacingBelow(contentLabel.bottomAnchor, multiplier: 1).isActive = true
        contentSegmentedControl.leftAnchor.constraintEqualToSystemSpacingAfter(configView.leftAnchor, multiplier: 2).isActive = true
        configView.rightAnchor.constraintEqualToSystemSpacingAfter(contentSegmentedControl.rightAnchor, multiplier: 2).isActive = true

        effectLabel.translatesAutoresizingMaskIntoConstraints = false
        effectLabel.topAnchor.constraintEqualToSystemSpacingBelow(contentSegmentedControl.bottomAnchor, multiplier: 2).isActive = true
        effectLabel.leftAnchor.constraintEqualToSystemSpacingAfter(configView.leftAnchor, multiplier: 2).isActive = true
        configView.rightAnchor.constraintGreaterThanOrEqualToSystemSpacingAfter(effectLabel.rightAnchor, multiplier: 2).isActive = true

        firstEffectSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        firstEffectSegmentedControl.topAnchor.constraintEqualToSystemSpacingBelow(effectLabel.bottomAnchor, multiplier: 1).isActive = true
        firstEffectSegmentedControl.leftAnchor.constraintEqualToSystemSpacingAfter(configView.leftAnchor, multiplier: 2).isActive = true
        configView.rightAnchor.constraintEqualToSystemSpacingAfter(firstEffectSegmentedControl.rightAnchor, multiplier: 2).isActive = true

        secondEffectSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        secondEffectSegmentedControl.topAnchor.constraintEqualToSystemSpacingBelow(firstEffectSegmentedControl.bottomAnchor, multiplier: 1).isActive = true
        secondEffectSegmentedControl.leftAnchor.constraintEqualToSystemSpacingAfter(configView.leftAnchor, multiplier: 2).isActive = true
        configView.rightAnchor.constraintEqualToSystemSpacingAfter(secondEffectSegmentedControl.rightAnchor, multiplier: 2).isActive = true

        sliderLabel.translatesAutoresizingMaskIntoConstraints = false
        sliderLabel.topAnchor.constraintEqualToSystemSpacingBelow(secondEffectSegmentedControl.bottomAnchor, multiplier: 2).isActive = true
        sliderLabel.leftAnchor.constraintEqualToSystemSpacingAfter(configView.leftAnchor, multiplier: 2).isActive = true
        configView.rightAnchor.constraintGreaterThanOrEqualToSystemSpacingAfter(sliderLabel.rightAnchor, multiplier: 2).isActive = true

        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.topAnchor.constraintEqualToSystemSpacingBelow(sliderLabel.bottomAnchor, multiplier: 1).isActive = true
        slider.leftAnchor.constraintEqualToSystemSpacingAfter(configView.leftAnchor, multiplier: 2).isActive = true
        configView.rightAnchor.constraintEqualToSystemSpacingAfter(slider.rightAnchor, multiplier: 2).isActive = true
        configView.bottomAnchor.constraintEqualToSystemSpacingBelow(slider.bottomAnchor, multiplier: 4).isActive = true
    }

}

private extension View {
    struct Subview {
        static var configView: UIView {
            let view = UIView(frame: .zero)
            view.backgroundColor = UIColor.white.withAlphaComponent(0.9)
            view.layer.borderColor = view.tintColor.cgColor
            view.layer.borderWidth = 1
            return view
        }

        static var configLabel: UILabel {
            let label = UILabel(frame: .zero)
            label.font = UIFont.preferredFont(forTextStyle: .caption1)
            label.textColor = label.tintColor
            return label
        }

        static var textLabel: UILabel {
            let label = UILabel(frame: .zero)
            label.numberOfLines = 0
            return label
        }

        static var imageView: UIImageView {
            let view = UIImageView(image: #imageLiteral(resourceName: "antrykot"))
            view.contentMode = .scaleAspectFit
            return view
        }

        static var visualEffectView: CustomIntensityVisualEffectView {
            return CustomIntensityVisualEffectView(effect: nil, intensity: 1)
        }

        static var slider: UISlider {
            let slider = UISlider(frame: .zero)
            slider.isContinuous = true
            slider.minimumValue = 0
            slider.maximumValue = 1
            return slider
        }
    }
}
