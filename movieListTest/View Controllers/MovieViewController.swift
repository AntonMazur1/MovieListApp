//
//  ViewController.swift
//  movieListTest
//
//  Created by Клоун on 31.08.2022.
//

import UIKit

class MovieViewController: UIViewController {
    
    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet weak var movieTitleTextField: UITextField!
    @IBOutlet weak var movieYearTextField: UITextField!
    
    private var movieTitle: [String] = []
    private var movieYear: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieYearTextField.delegate = self
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.separatorStyle = .none
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func addMoviePressed() {
        guard let title = movieTitleTextField.text,
              let year = movieYearTextField.text,
              !title.trimmingCharacters(in: .whitespaces).isEmpty,
              !year.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            showAlert()
            return
        }
        
        if !(movieTitle.contains(title)) {
            movieTitle.append(title)
            movieYear.append(year)
            movieTableView.reloadData()
        }
        
        movieTitleTextField.text = ""
        movieYearTextField.text = ""
    }
    
    private func showAlert() {
        let alertController = UIAlertController(
            title: "Something wrong",
            message: "Please check your information and try again",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}

//MARK: - Table View Delegate
extension MovieViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movieTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        let movieTitle = movieTitle[indexPath.row]
        let movieYear = movieYear[indexPath.row]
        cell.configureCell(with: movieTitle, and: movieYear)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            movieTitle.remove(at: indexPath.row)
            movieYear.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

//MARK: - UITextField Delegate
extension MovieViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == movieYearTextField {
            let allowedCharacters = CharacterSet(charactersIn: "0123456789")
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
}
