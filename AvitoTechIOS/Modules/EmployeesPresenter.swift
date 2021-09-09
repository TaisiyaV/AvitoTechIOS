//
//  EmployeesPresenter.swift
//  AvitoTechIOS
//
//  Created by tasya on 09.09.2021.
//

import UIKit

protocol EmployeesViewInput: class {
    func fetchData()
}

protocol EmployeesPresenterProtocol: class {
    var dataArray: [Employee] {get set}
    func receiveData(dataViewModel: CompanyModel)
    func didReceive(error: Error)
}

class EmployeesPresenter: EmployeesPresenterProtocol {
    
    weak var view: EmployeesViewController?
    var interactor: EmployeeInteractorProtocol!
    
    var dataArray: [Employee] = []
    
    init(interactor: EmployeeInteractorProtocol, view: EmployeesViewController?) {
        self.interactor = interactor
        self.view = view
    }
    
    func receiveData(dataViewModel: CompanyModel) {
        dataArray = dataViewModel.company.employees.sorted { $0.name < $1.name}
        let title = dataViewModel.company.name

        view?.employees = dataArray
        view?.tableView.reloadData()
        view?.navigationItem.title = title
    }
    
    func didReceive(error: Error) {
        
        let alert = UIAlertController(title: "Error", message: error.localizedDescription.localizedCapitalized, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            alert.dismiss(animated: true, completion: nil)
        })
        let retry = UIAlertAction(title: "Retry", style: .default) { (action) -> Void in
            alert.dismiss(animated: true) {
                self.interactor.loadDataFromJson()
            }
        }
        alert.addAction(ok)
        alert.addAction(retry)
        view?.navigationController?.present(alert, animated: true)
    }
}

extension EmployeesPresenter: EmployeesViewInput {
    func fetchData() {
        interactor.loadDataFromJson()
    }
}
