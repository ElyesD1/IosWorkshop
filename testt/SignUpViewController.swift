//
//  SignUpViewController.swift
//  testt
//
//  Created by Apple Esprit on 17/9/2024.
//
import UIKit

class SignUpViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    
    @IBOutlet weak var Userinput: UITextField!
    @IBOutlet weak var Emailinput: UITextField!
    @IBOutlet weak var Passwordinput: UITextField!
    @IBOutlet weak var Confirminput: UITextField!
    @IBOutlet weak var Dateinput: UIDatePicker!
    
    // MARK: - Signin Action
    @IBAction func signin(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Create Account Action
    @IBAction func CreateAcc(_ sender: Any) {
        guard let username = Userinput.text,
              let email = Emailinput.text,
              let password = Passwordinput.text,
              let confirmPassword = Confirminput.text else { return }
        
        // Validate fields dynamically
        if let errorMessage = validateFields(username: username, email: email, password: password, confirmPassword: confirmPassword) {
            showAlert(title: "Input Error", message: errorMessage)
        } else {
            // If all validations pass, proceed with account creation
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            let birthday = dateFormatter.string(from: Dateinput.date)
            
            // Display success message
            let alert = UIAlertController(
                title: "Account Successfully Created",
                message: "Username: \(username)\nEmail: \(email)\nBirthday: \(birthday)",
                preferredStyle: .alert
            )
            let action = UIAlertAction(title: "OK", style: .default) { _ in
                self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: - Validate Fields
    func validateFields(username: String, email: String, password: String, confirmPassword: String) -> String? {
        // Check if any fields are empty
        if username.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty {
            return "All fields are required."
        }
        
        // Username Validation: Only alphabet characters and spaces
        let usernameRegex = "^[A-Za-z ]+$" // Allows letters and spaces
        let usernameTest = NSPredicate(format: "SELF MATCHES %@", usernameRegex)
        if !usernameTest.evaluate(with: username) {
            return "Username should only contain alphabet characters and spaces."
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
        
        // Confirm Password Validation: Must match the password
        if password != confirmPassword {
            return "Confirm password must match the password."
        }
        
        return nil // No validation errors
    }
    
    // MARK: - Helper function to show alerts
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
