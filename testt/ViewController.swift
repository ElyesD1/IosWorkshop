//
//  ViewController.swift
//  testt
//
//  Created by Apple Esprit on 17/9/2024.
//
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    // MARK: - Signup Button Action
    @IBAction func Signup(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let signupVC = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController {
            navigationController?.pushViewController(signupVC, animated: true)
        }
    }
    
    // MARK: - Login Button Action
    @IBAction func handleLogin(_ sender: Any) {
        guard let username = userInput.text, let email = emailInput.text, let password = passwordInput.text else { return }
        
        // Validate fields
        if let errorMessage = validateFields(username: username, email: email, password: password) {
            showAlert(title: "Input Error", message: errorMessage)
        } else {
            // If all validations pass, show the login details in an alert and navigate to TViewController
            let alert = UIAlertController(
                title: "USER Authenticated",
                message: "USER LOGGED IN\nUsername: \(username)\nEmail: \(email)",
                preferredStyle: .alert
            )
            let action = UIAlertAction(title: "OK", style: .default) { _ in
                self.navigateToTViewController()
            }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: - Validate Fields
    func validateFields(username: String, email: String, password: String) -> String? {
        // Check if any fields are empty
        if username.isEmpty || email.isEmpty || password.isEmpty {
            return "All fields are required."
        }
        
        // Username Validation: Only alphabet characters
        let usernameRegex = "^[A-Za-z]+$"
        let usernameTest = NSPredicate(format: "SELF MATCHES %@", usernameRegex)
        if !usernameTest.evaluate(with: username) {
            return "Username should only contain alphabet characters."
        }
        
        // Email Validation: Must be a valid email format
        let emailRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if !emailTest.evaluate(with: email) {
            return "Please enter a valid email address."
        }
        
        // Password Validation: Must be at least 8 characters long
        if password.count < 8 {
            return "Password must be at least 8 characters long."
        }
        
        return nil // No validation errors
    }
    
    // MARK: - Navigation to TViewController
    func navigateToTViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let tViewController = storyboard.instantiateViewController(withIdentifier: "TViewController") as? TViewController {
            navigationController?.pushViewController(tViewController, animated: true)
        }
    }
    
    // MARK: - Helper function to show alerts
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
