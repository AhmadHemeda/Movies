import Foundation

class ViewModel {
    
    var bindResultToViewController: (() -> ()) = {}
    
    var VMResult: [Item]! {
        didSet {
            bindResultToViewController()
        }
    }
    
    func getItems() {
        NetworkService.getResults() { (result) in
            guard let result = result else { return }
            self.VMResult = result.items
        }
    }
    
}
