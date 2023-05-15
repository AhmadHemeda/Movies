import UIKit
import Kingfisher

class MovieCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var viewModel: ViewModel!
    
    var movies: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ViewModel()
        
        viewModel.getItems()
        
        viewModel.bindResultToViewController = {() in
            self.renderView()
        }
        
        self.collectionView.reloadData()
    }
    
    func renderView() {
        DispatchQueue.main.async {
            self.movies = self.viewModel.VMResult
            self.collectionView.reloadData()
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MovieCollectionViewCell
        let movie = movies[indexPath.row]
        let url = URL(string: (movie.image)!)
        
        cell.movieImageView.kf.setImage(with: url)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destinationVC = storyboard!.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        destinationVC.movie = movies[indexPath.row]
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 190, height: 200)
    }
    
}
