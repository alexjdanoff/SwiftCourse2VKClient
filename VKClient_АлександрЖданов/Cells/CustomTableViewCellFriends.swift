import UIKit

class CustomTableViewCellFriends: UITableViewCell {


    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var tealView: UIView!
    
    let ageText = "Возраст: "
    let sexText = "Пол: "
    let countryText = "Страна: "
    
    var clusure: (() -> Void)?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImageView.image = nil
        nameLabel.text = nil
        ageLabel.text = nil
        sexLabel.text = nil
        countryLabel.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarComfigure()
    }
    
    func configure(friend: Friend, clusure: @escaping (() -> Void)) {
        if let imageName = friend.avatar {
            avatarImageView.image = UIImage(named: imageName)
        }
        nameLabel.text = friend.name
        ageLabel.text = friend.age
        sexLabel.text = friend.sex
        countryLabel.text = friend.country
        self.clusure = clusure
    }
    
    func avatarComfigure() {
    avatarImageView.layer.cornerRadius = tealView.frame.size.height / 2
    tealView.layer.cornerRadius = tealView.frame.size.height / 2

    tealView.layer.shadowColor = UIColor.black.cgColor
    tealView.layer.shadowOffset = CGSize(width: 10, height: 10)
    tealView.layer.shadowRadius = 15
    tealView.layer.shadowOpacity = 0.5
    }
    
    @IBAction func pressImegeViewButton(_ sender: UIButton) {
        
        let sourceFrame = avatarImageView.frame
        
        UIImageView.animate(withDuration: 0.2) {[weak self] in
            guard let self = self else {return}
            self.avatarImageView.frame = CGRect.zero
        } completion: { isSuccess in
            if isSuccess { UIView.animate(withDuration: 3,
                                          delay: 0,
                                          usingSpringWithDamping: 0.7,
                                          initialSpringVelocity: 0,
                                          options: [],
                                          animations: {[weak self] in
                guard let self = self else {return}
                self.avatarImageView.frame = sourceFrame
            },
                                          completion: { isSuccessfully in
                if isSuccessfully {
                    self.clusure?()
                }
            })
                
            }
        }
        
    }
    
}
