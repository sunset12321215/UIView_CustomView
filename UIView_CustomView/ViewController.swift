//
//  ViewController.swift
//  UIView_CustomView
//
//  Created by HoaLT-D1 on 6/13/19.
//  Copyright © 2019 HoaLT-D1. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    private struct AlertMessenger  {
        static let titleError = "Error"
        static let messageErrorEmail = "Email bạn nhập sai định dạng, vui lòng nhập lại."
        static let messageErrorAllTextField = "Chưa nhập đủ đầu vào"
        
        static let titleSuccess = "Success"
    }
    
    @IBOutlet private weak var firstNameTextField: UITextField!
    @IBOutlet private weak var lastNameTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var phoneNumberTextField: UITextField!
    
    @IBOutlet var collectionTextField: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextField()
    }
    
    private func setUpTextField() {
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
    }
    
    private func checkEmailCorrect(email: String) {
        if email[0] == " " || email[email.count - 1] == " " || email.contains(" ") || !email.contains("@") || !email.contains(".com") {
            showAlert(title: AlertMessenger.titleError, message: AlertMessenger.messageErrorEmail)
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertActionOK = UIAlertAction(title: "OK", style: .default, handler:  nil)
        alertController.addAction(alertActionOK)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func submitButton(_ sender: Any) {
        collectionTextField.forEach { (textField) in
            if textField.text == "" {
                showAlert(title: AlertMessenger.titleError, message: AlertMessenger.messageErrorAllTextField)
                return
            }
        }
        
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        
        let name = firstName + " " + lastName
        let email = emailTextField.text ?? ""
        let phone = phoneNumberTextField.text ?? ""
        
        let messageAlert = """
        \(name)
        \(email)
        \(phone)
        """
        showAlert(title: AlertMessenger.titleSuccess, message: messageAlert)
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        
        if nextTag == emailTextField.tag + 1 {
            checkEmailCorrect(email: emailTextField.text ?? "")
        }
        
        let nextResponder = textField.superview?.viewWithTag(nextTag) as UIResponder?
        let _ = nextResponder != nil ? nextResponder?.becomeFirstResponder() : textField.resignFirstResponder()
        return false
    }
}
