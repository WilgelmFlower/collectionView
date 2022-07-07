import UIKit

class ViewController: UIViewController {
    
    enum Metric {
        static let layoutIndent: CGFloat = 12
        static let leftIndentLayout: CGFloat = 6
        static let photoRadius: CGFloat = 10
        static let topIndentVerticalSection: CGFloat = 20
    }
    
    let data = [
        
        Albums(type: .albumTwoRows, title: "My Albums", button: "See All", albums: [
            Album(title: "Recents", image: #imageLiteral(resourceName: "image8"), numbersOfPhotos: 1092),
            Album(title: "WhatsApp", image: #imageLiteral(resourceName: "image11"), numbersOfPhotos: 109),
            Album(title: "Favourites", image: #imageLiteral(resourceName: "image2"), numbersOfPhotos: 24),
            Album(title: "Snapseed", image: #imageLiteral(resourceName: "image12"), numbersOfPhotos: 53),
            Album(title: "Lightroom", image: #imageLiteral(resourceName: "image7"), numbersOfPhotos: 666),
            Album(title: "VN", image: #imageLiteral(resourceName: "image3"), numbersOfPhotos: 235),
            Album(title: "Instagram", image: #imageLiteral(resourceName: "image5"), numbersOfPhotos: 192),
            Album(title: "Telegram", image: #imageLiteral(resourceName: "image6"), numbersOfPhotos: 14),
        ]),
        
        Albums(type: .albumOneRow, title: "People & Places", button: "See All", albums: [
            Album(title: "Places", image: #imageLiteral(resourceName: "image9"), numbersOfPhotos: 11),
            Album(title: "Summer2021", image: #imageLiteral(resourceName: "image1"), numbersOfPhotos: 8),
            Album(title: "Winter2019", image: #imageLiteral(resourceName: "image7"), numbersOfPhotos: 10),
            Album(title: "Autumn2020", image: #imageLiteral(resourceName: "image4"), numbersOfPhotos: 100)
        ]),
        
        Albums(type: .firstListSection, title: "Media Types", button: nil, albums: [
            Album(title: "Videos", image: UIImage(systemName: "video"), numbersOfPhotos: 84),
            Album(title: "Selfies", image: UIImage(systemName: "person.crop.square"), numbersOfPhotos: 148),
            Album(title: "Live Photos", image: UIImage(systemName: "livephoto"), numbersOfPhotos: 148),
            Album(title: "Portrait", image: UIImage(systemName: "cube"), numbersOfPhotos: 148),
            Album(title: "Long Exposure", image: UIImage(systemName: "livephoto"), numbersOfPhotos: 148),
            Album(title: "Time-lapse", image: UIImage(systemName: "timelapse"), numbersOfPhotos: 148),
            Album(title: "Slo-mo", image: UIImage(systemName: "slowmo"), numbersOfPhotos: 148),
            Album(title: "Bursts", image: UIImage(systemName: "square.stack.3d.down.right"), numbersOfPhotos: 148),
            Album(title: "Screenshots", image: UIImage(systemName: "camera.viewfinder"), numbersOfPhotos: 148)
        ]),
        
        Albums(type: .secondListSection, title: "Utilities", button: nil, albums: [
            Album(title: "Imports", image: UIImage(systemName: "square.and.arrow.down"), numbersOfPhotos: 84),
            Album(title: "Hidden", image: UIImage(systemName: "eye.slash"), numbersOfPhotos: 84),
            Album(title: "Recently Deleted", image: UIImage(systemName: "trash"), numbersOfPhotos: 84)
        ])
      ]
    
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.reuseID)
        cv.register(ListCollection.self, forCellWithReuseIdentifier: ListCollection.reuseID)
        cv.register(HeaderFill.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderFill.identifier)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItem()
        view.addSubview(collectionView)

        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let albumGroup = self.data[sectionIndex]
            switch albumGroup.type {
            case .albumTwoRows:
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
                let contentInset = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 10, trailing: 5)
                
                let topItem = NSCollectionLayoutItem(layoutSize: itemSize)
                topItem.contentInsets = contentInset
                
                let bottomItem = NSCollectionLayoutItem(layoutSize: itemSize)
                bottomItem.contentInsets = contentInset
                
                let nestedGroup = NSCollectionLayoutGroup.vertical(
                    layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(190), heightDimension: .absolute(500)),
                    subitems: [topItem, bottomItem])
                
                let section = NSCollectionLayoutSection(group: nestedGroup)
                section.contentInsets = .init(top: 0, leading: 15, bottom: 20, trailing: 0)
                section.orthogonalScrollingBehavior = .groupPaging
                
                let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                              heightDimension: .estimated(44))
                
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerFooterSize,
                                                                                elementKind: UICollectionView.elementKindSectionHeader,
                                                                                alignment: .top)
                
                section.boundarySupplementaryItems = [sectionHeader]
                
                return section
                
            case .albumOneRow:
                
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
                let contentInset = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 10, trailing: 5)
                
                let Item = NSCollectionLayoutItem(layoutSize: itemSize)
                Item.contentInsets = contentInset
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(190), heightDimension: .absolute(260)), subitem: Item, count: 1)
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 0, leading: 15, bottom: 20, trailing: 0)
                section.orthogonalScrollingBehavior = .paging
                
                let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                              heightDimension: .estimated(44))
                
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerFooterSize,
                                                                                elementKind: UICollectionView.elementKindSectionHeader,
                                                                                alignment: .top)
                
                section.boundarySupplementaryItems = [sectionHeader]
                
                return section
               
            case .firstListSection:
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(52))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: Metric.topIndentVerticalSection, leading: .zero, bottom: .zero, trailing: .zero)
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: itemSize, subitem: item, count: 1)
                
                let section = NSCollectionLayoutSection(group: group)
                
                section.contentInsets.leading = Metric.layoutIndent
                
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: itemSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                header.zIndex = Int.max
                section.boundarySupplementaryItems = [header]
                
                return section
                
            case .secondListSection:
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(52))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: Metric.topIndentVerticalSection, leading: .zero, bottom: .zero, trailing: .zero)
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: itemSize, subitem: item, count: 1)
                
                let section = NSCollectionLayoutSection(group: group)
                
                section.contentInsets.leading = Metric.layoutIndent
                
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: itemSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                header.zIndex = Int.max
                section.boundarySupplementaryItems = [header]
                
                return section
                
            }
        }
        return layout
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderFill.identifier, for: indexPath) as! HeaderFill
        header.headerTextAndButton(titleSection: data[indexPath.section].title, buttonSection: data[indexPath.section].button ?? "")
        header.frame.size.height = 68
        return header
    }
    
    private func configureItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self, action: nil)
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[section].albums.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let data = data[indexPath.section]
        let item = data.albums[indexPath.row]
        
        switch data.type {
            
        case .firstListSection:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollection.reuseID, for: indexPath) as? ListCollection else { return UICollectionViewCell() }
            cell.iconView.image = item.image ?? UIImage(named: "")
            cell.nameLabel.text = item.title
            cell.numberPhotosLabel.text = String(item.numbersOfPhotos)
            cell.lineSeparators.isHidden = indexPath.row == 8 ? true : false
            return cell
            
        case .secondListSection:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollection.reuseID, for: indexPath) as? ListCollection else { return UICollectionViewCell() }
            cell.iconView.image = item.image ?? UIImage(named: "")
            cell.nameLabel.text = item.title
            cell.numberPhotosLabel.text = String(item.numbersOfPhotos)
            cell.lineSeparators.isHidden = indexPath.row == 2 ? true : false
            return cell
            
        case .albumTwoRows, .albumOneRow:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseID, for: indexPath) as? PhotoCell else { return UICollectionViewCell() }
            cell.photoImageView.image = item.image ?? UIImage(named: "")
            cell.namePhotoLabel.text = item.title
            cell.numberPhotosLabel.text = String(item.numbersOfPhotos)
            return cell
    }
}
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 1.5, height: collectionView.frame.height / 3)
    }
}
    
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
    
    fileprivate let namePhotoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    fileprivate let numberPhotosLabel: UILabel = {
        let labelNumberPhotos = UILabel()
        labelNumberPhotos.textColor = .systemGray
        return labelNumberPhotos
    }()
    
    fileprivate let photoImageView: UIImageView = {
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


