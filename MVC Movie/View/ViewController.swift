import UIKit
import Cosmos

class ViewController: UIViewController {
    
    var movie: Item?
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var weeklyGrossLabel: UILabel!
    @IBOutlet weak var totalGrossLabel: UILabel!
    @IBOutlet weak var totalWeeksLabel: UILabel!
    @IBOutlet weak var rankCosmosView: CosmosView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: (movie?.image)!)
        movieImageView.kf.setImage(with: url)
        
        titleLabel.text = movie?.title
        weeklyGrossLabel.text = movie?.weekend
        totalGrossLabel.text = movie?.gross
        totalWeeksLabel.text = movie?.weeks
        if let rankString = movie?.rank, let rankDouble = Double(rankString) {
            let result = rankDouble / 2
            rankCosmosView.rating = result
        }
    }
}

