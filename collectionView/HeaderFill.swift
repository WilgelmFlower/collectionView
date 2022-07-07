import UIKit

class HeaderFill: UICollectionReusableView {
    
    static let identifier = "HeaderFill"

    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        return button
    }()
    
    private let line: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.26)
        return view
    }()
    
    public func headerTextAndButton(titleSection: String, buttonSection: String) {
        label.text = titleSection
        button.setTitle(buttonSection, for: .normal)
    }
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabelConstraints()
        buttonConstraints()
        separatorLineConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabelConstraints() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          label.centerYAnchor.constraint(equalTo: centerYAnchor),
          label.centerXAnchor.constraint(equalTo: centerXAnchor),
          label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -8),
          label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
      }
    
    private func buttonConstraints() {
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          button.centerYAnchor.constraint(equalTo: centerYAnchor),
          button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 300),
          button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
      }
    
    private func separatorLineConstraints() {
        addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            line.topAnchor.constraint(equalTo: label.topAnchor, constant: -8),
            line.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            line.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            line.heightAnchor.constraint(equalToConstant: 1)
        ])
      }
}
