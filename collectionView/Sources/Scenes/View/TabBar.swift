import UIKit

class TabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupNavigationViewController()
    }
    
    func setupNavigationViewController() {
        viewControllers = [
            createNavController(for: ViewController(), title: "Library", image: UIImage(systemName: "photo.fill.on.rectangle.fill")),
            createNavController(for: ViewController(), title: "For You", image: UIImage(systemName: "heart.text.square")),
            createNavController(for: ViewController(), title: "Abums", image: UIImage(systemName: "square.stack.fill")),
            createNavController(for: ViewController(), title: "Search", image: UIImage(systemName: "magnifyingglass"))
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage?) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
}
