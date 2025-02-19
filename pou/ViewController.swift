import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var Header: UIView!
    
    @IBOutlet weak var Pou: UIImageView!
    
    @IBOutlet weak var stool: UIImageView!
    
    @IBOutlet weak var roomName: UILabel!
    
    @IBOutlet weak var foodChoice: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        background.image = UIImage(named: "backgroundKitchen")
        Pou.image = UIImage(named: "pou")
        stool.image = UIImage(named: "stool")
        roomName.text = "Kitchen"
        foodChoice.image = UIImage(named: "pizza")
       
        // Do any additional setup after loading the view.
    }


}

