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
    let visualEffectView = Subview.visualEffectView
    let slider = Subview.slider
    let contentSegmentedControl = UISegmentedControl(items: [])
    let firstEffectSegmentedControl = UISegmentedControl(items: [])
    let secondEffectSegmentedControl = UISegmentedControl(items: [])

    private func addSubviews() {
        addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(visualEffectView)
        addSubview(contentSegmentedControl)
        addSubview(firstEffectSegmentedControl)
        addSubview(secondEffectSegmentedControl)
        addSubview(slider)
    }

    // MARK: Layout

    private func setupLayout() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        visualEffectView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        visualEffectView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        contentSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        contentSegmentedControl.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 32).isActive = true
        contentSegmentedControl.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        contentSegmentedControl.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true

        firstEffectSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        firstEffectSegmentedControl.topAnchor.constraint(equalTo: contentSegmentedControl.bottomAnchor, constant: 16).isActive = true
        firstEffectSegmentedControl.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        firstEffectSegmentedControl.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true

        secondEffectSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        secondEffectSegmentedControl.topAnchor.constraint(equalTo: firstEffectSegmentedControl.bottomAnchor, constant: 0).isActive = true
        secondEffectSegmentedControl.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        secondEffectSegmentedControl.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true

        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.topAnchor.constraint(equalTo: secondEffectSegmentedControl.bottomAnchor, constant: 16).isActive = true
        slider.leftAnchor.constraint(equalTo: leftAnchor, constant: 32).isActive = true
        slider.rightAnchor.constraint(equalTo: rightAnchor, constant: -32).isActive = true
        slider.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32).isActive = true
    }

}

private extension View {
    struct Subview {
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
