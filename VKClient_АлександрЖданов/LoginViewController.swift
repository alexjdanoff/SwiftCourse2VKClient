
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    private let toGreenSegue = "fromLoginToGreen"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(onPressed(_:)), name: Notification.Name("pressLoginButton"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
        recognizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(recognizer)
    }
    
    @objc func onTap(_ recognizer: UIGestureRecognizer) {
        
        self.view.endEditing(true)
    }
    
    
    @objc func keyboardDidShow(_ notification: Notification) {
        
        let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        guard let keyboardHeight = keyboardSize?.height else {return}
        
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight + 100, right: 0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardDidHide(_ notification: Notification) {
        
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    
    @objc func onPressed(_ notification: Notification) {
        
        if notification.object != nil {
            
            func checkUserData() -> Bool {
                guard let login = loginTextField.text,
                      let password = passwordTextField.text else { return false }
                
                if login == "Alex" && password == "1234" {
                    return true
                } else {
                    return false
                }
                
            }
            
            func showLoginError() {
                
                let alter = UIAlertController(title: "Ошибка", message: "Введены не верные данные пользователя", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .cancel, handler: nil);            alter.addAction(action)
                present(alter, animated: true, completion: nil)
            }
            
            if checkUserData() == true {
                performSegue(withIdentifier: toGreenSegue, sender: nil)
            } else {
                showLoginError()
                loginTextField.layer.masksToBounds = true
                loginTextField.layer.borderColor = UIColor.red.cgColor
                loginTextField.layer.borderWidth = 1.0
                passwordTextField.layer.masksToBounds = true
                passwordTextField.layer.borderColor = UIColor.red.cgColor
                passwordTextField.layer.borderWidth = 1.0
            }
            
        }
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func pressLoginButton(_ sender: Any) {
        
        _ = shouldPerformSegue
        
        NotificationCenter.default.post(name: Notification.Name("pressLoginButton"), object: shouldPerformSegue)
        
    }
}

