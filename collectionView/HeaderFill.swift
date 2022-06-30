import UIKit

class HeaderFill: UICollectionReusableView {
    
    static let identifier = "HeaderFill"

    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = label.font.withSize(20)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    public func headerText(titleSection: String) {
        label.text = titleSection
    }
    
    private let labelTwo: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = label.font.withSize(20)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 60))
        button.setTitle("See All", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        return button
    }()
    
    private let Separatorline: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.26)
        return view
    }()
    
    private let SeparatorlineTwo: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.26)
        return view
    }()
    
    public func configure() {
        backgroundColor = .white
        addSubview(label)
        addSubview(button)
        addSubview(Separatorline)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabelConstraints()
        buttonConstraints()
        separatorLineConstraints()
        separatorLineConstraintsTwo()
        setupLabelConstraintsTwo()
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
    
    private func setupLabelConstraintsTwo() {
        addSubview(labelTwo)
        labelTwo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelTwo.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 560),
            labelTwo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -8),
            labelTwo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        ])
      }

    private func buttonConstraints() {
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          button.centerYAnchor.constraint(equalTo: centerYAnchor),
          button.centerXAnchor.constraint(equalTo: centerXAnchor),
          button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 300),
          button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
      }
    
    private func separatorLineConstraints() {
        addSubview(Separatorline)
        Separatorline.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            Separatorline.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            Separatorline.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            Separatorline.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            Separatorline.heightAnchor.constraint(equalToConstant: 1)
        ])
      }
    
    private func separatorLineConstraintsTwo() {
        addSubview(SeparatorlineTwo)
        SeparatorlineTwo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            SeparatorlineTwo.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 530),
            SeparatorlineTwo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            SeparatorlineTwo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            SeparatorlineTwo.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
}
