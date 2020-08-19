// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/

#if !os(macOS)

import UIKit

public typealias AKLabel = UILabel

public class AKLiveViewController: UIViewController {

    var stackView: UIStackView!

    public override func loadView() {
        stackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 400, height: 100))
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.view = stackView
    }

    public func addTitle(_ text: String) {
        let newLabel = UILabel()
        newLabel.text = text
        newLabel.textAlignment = .center
        newLabel.textColor = AKStylist.sharedInstance.fontColor
        newLabel.font = UIFont.boldSystemFont(ofSize: 24)
        newLabel.sizeThatFits(CGSize(width: 400, height: 80))
        newLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        addView(newLabel)
    }

    public func addLabel(_ text: String) -> AKLabel {
        let newLabel = AKLabel(frame: CGRect(x: 0, y: 0, width: 400, height: 80))
        newLabel.text = text
        newLabel.textColor = AKStylist.sharedInstance.fontColor
        newLabel.font = UIFont.systemFont(ofSize: 18)
        newLabel.sizeThatFits(CGSize(width: 400, height: 40))
        newLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        addView(newLabel)
        return newLabel
    }

    public func addView(_ newView: UIView) {
        newView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        if newView.frame.height <= 60 {
            newView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        } else {
            newView.heightAnchor.constraint(equalToConstant: newView.frame.height).isActive = true
        }
        stackView.addArrangedSubview(newView)
        stackView.sizeThatFits(CGSize(width: stackView.frame.width,
                                      height: stackView.frame.height + newView.frame.height))
    }
}

#else

import Cocoa

open class AKLiveViewController: NSViewController {

    var stackView: NSStackView!
    var textField: NSTextField?

    override open func loadView() {
        stackView = NSStackView(frame: NSRect(width: 400, height: 100))
        stackView.alignment = .centerX
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.layer?.backgroundColor = NSColor.black.cgColor
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.view = stackView

    }

    public func addTitle(_ text: String) {
        let newLabel = NSTextField()
        newLabel.stringValue = text
        newLabel.isEditable = false
        newLabel.drawsBackground = false
        newLabel.isBezeled = false
        newLabel.alignment = .center
        newLabel.textColor = AKStylist.sharedInstance.fontColor
        newLabel.font = .boldSystemFont(ofSize: 24)
        newLabel.setFrameSize(NSSize(width: 400, height: 40))
        newLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        addView(newLabel)
    }

    public func addLabel(_ text: String) -> AKLabel {
        let newLabel = AKLabel(frame: NSRect(width: 400, height: 80))
        newLabel.stringValue = text
        newLabel.isEditable = false
        newLabel.drawsBackground = false
        newLabel.isBezeled = false
        newLabel.textColor = AKStylist.sharedInstance.fontColor
        newLabel.font = .systemFont(ofSize: 18)
        newLabel.setFrameSize(NSSize(width: 400, height: 40))
        newLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        addView(newLabel)
        return newLabel
    }

    public func addView(_ newView: NSView) {
        newView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        if newView.frame.height <= 60 {
            newView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        } else {
            newView.heightAnchor.constraint(equalToConstant: newView.frame.height).isActive = true
        }
        stackView.addArrangedSubview(newView)
        stackView.setFrameSize(NSSize(width: stackView.frame.width,
                                      height: stackView.frame.height + newView.frame.height))
    }
}

#endif