


import UIKit

class FullGalleryVC: UIViewController {
    
    
    @IBOutlet weak var browsingImage: UIImageView!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    var newImage: String = ""
    var image: UIImage!
    var isHeartActive = false
    var countLike = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image = UIImage(named: newImage)
        browsingImage.image = image
        
    }
    
    @IBAction func pressHeartButton(_ sender: UIButton) {
        
        if isHeartActive {
            UIView.transition(with: heartButton,
                              duration: 0.7,
                              options: .transitionFlipFromTop) {[weak self] in
                self?.heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
            }
            countLike -= 1
            countLabel.text = String(countLike)
        }
        else {
            UIView.transition(with: heartButton,
                              duration: 0.7,
                              options: .transitionFlipFromTop) {[weak self] in
                self?.heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            }
            countLike += 1
            countLabel.text = String(countLike)
        }
        isHeartActive = !isHeartActive
    }
}



