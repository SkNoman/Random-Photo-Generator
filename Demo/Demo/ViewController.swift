import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .green
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Random Photo", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        view.addSubview(button)
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 20, y: view.frame.size.height-100-view.safeAreaInsets.bottom, width:view.frame.size.width-40 , height: 40)
        button.layer.cornerRadius = .init(20)
    }
    
    @objc func didTapButton(){
        getRandomPhoto()
    }
    func getRandomPhoto(){
        let urlString = "https://source.unsplash.com/300x300"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url)else{
            return
        }
        imageView.image = UIImage(data: data)
    }


}

