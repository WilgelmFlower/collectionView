import UIKit

class PhotoCell: UICollectionViewCell {
    
    static let reuseID = "HorizontalCollection"
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0))
    }
    
    var data: Album? {
        didSet {
            guard let data = data else { return }
            photoImageView.image = data.image
            namePhotoLabel.text = data.title
            numberPhotosLabel.text = String(data.numbersOfPhotos)
        }
    }
    
    lazy var namePhotoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    lazy var numberPhotosLabel: UILabel = {
        let labelNumberPhotos = UILabel()
        labelNumberPhotos.textColor = .systemGray
        return labelNumberPhotos
    }()
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "image5")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(photoImageView)
        contentView.addSubview(namePhotoLabel)
        setupLabelConstraint()
        setupIntLabelConstraint()
        setupPhotoItemConstraint()
    }
    
    private func setupPhotoItemConstraint() {
        photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    private func setupLabelConstraint() {
        addSubview(namePhotoLabel)
        namePhotoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            namePhotoLabel.centerYAnchor.constraint(equalTo: bottomAnchor),
            namePhotoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            namePhotoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            namePhotoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
    
    private func setupIntLabelConstraint() {
        addSubview(numberPhotosLabel)
        numberPhotosLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numberPhotosLabel.centerYAnchor.constraint(equalTo: namePhotoLabel.bottomAnchor, constant: 10),
            numberPhotosLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            numberPhotosLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            numberPhotosLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



