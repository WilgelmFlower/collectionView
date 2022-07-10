import UIKit

class ViewController: UIViewController {

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
        
        Albums(type: .list, title: "Media Types", button: nil, albums: [
            Album(title: "Videos", image: UIImage(systemName: "video"), numbersOfPhotos: 84),
            Album(title: "Selfies", image: UIImage(systemName: "person.crop.square"), numbersOfPhotos: 16),
            Album(title: "Live Photos", image: UIImage(systemName: "livephoto"), numbersOfPhotos: 54),
            Album(title: "Portrait", image: UIImage(systemName: "cube"), numbersOfPhotos: 50),
            Album(title: "Long Exposure", image: UIImage(systemName: "livephoto"), numbersOfPhotos: 243),
            Album(title: "Time-lapse", image: UIImage(systemName: "timelapse"), numbersOfPhotos: 100),
            Album(title: "Slo-mo", image: UIImage(systemName: "slowmo"), numbersOfPhotos: 4),
            Album(title: "Bursts", image: UIImage(systemName: "square.stack.3d.down.right"), numbersOfPhotos: 1),
            Album(title: "Screenshots", image: UIImage(systemName: "camera.viewfinder"), numbersOfPhotos: 90)
        ]),
        
        Albums(type: .list, title: "Utilities", button: nil, albums: [
            Album(title: "Imports", image: UIImage(systemName: "square.and.arrow.down"), numbersOfPhotos: 30),
            Album(title: "Hidden", image: UIImage(systemName: "eye.slash"), numbersOfPhotos: 50),
            Album(title: "Recently Deleted", image: UIImage(systemName: "trash"), numbersOfPhotos: 20)
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

        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
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
               
            case .list:
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(52))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: Metric.topIndentVerticalSection, leading: .zero, bottom: .zero, trailing: .zero)
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: itemSize, subitem: item, count: 1)
                
                let section = NSCollectionLayoutSection(group: group)
                
                section.contentInsets.leading = Metric.layoutIndent
                
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: itemSize,
                                                                         elementKind: UICollectionView.elementKindSectionHeader,
                                                                         alignment: .top)
                
                header.zIndex = Int.max
                section.boundarySupplementaryItems = [header]
                
                return section
            }
        }
        return layout
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let dataHeader = data[indexPath.section]
        
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderFill.identifier, for: indexPath) as? HeaderFill else { return UICollectionReusableView() }

        header.headerTextAndButton(titleSection: dataHeader.title, buttonSection: dataHeader.button ?? "")
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
            
        case .list:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollection.reuseID, for: indexPath) as? ListCollection else { return UICollectionViewCell() }
            cell.iconView.image = item.image
            cell.nameLabel.text = item.title
            cell.numberPhotosLabel.text = String(item.numbersOfPhotos)
            return cell
            
        case .albumTwoRows, .albumOneRow:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseID, for: indexPath) as? PhotoCell else { return UICollectionViewCell() }
            cell.photoImageView.image = item.image
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

extension ViewController {
    
    enum Metric {
        static let layoutIndent: CGFloat = 12
        static let leftIndentLayout: CGFloat = 6
        static let photoRadius: CGFloat = 10
        static let topIndentVerticalSection: CGFloat = 20
    }
    
}
