import UIKit

class GeladeiraCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var foodImage: UIButton!
    
    func configure(foodImage: String, foodName: String) {
        self.foodImage.imageView?.image = UIImage(named: foodImage)
        self.foodLabel.text = foodName
    }
    
    override func awakeFromNib() {
            super.awakeFromNib()
        }
}
    
