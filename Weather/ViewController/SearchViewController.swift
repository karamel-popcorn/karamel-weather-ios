//
//  SearchViewController.swift
//  Weather
//
//  Created by Baek on 3/30/24.
//

import Foundation
import UIKit
import MapKit

class SearchViewController: UIViewController {
    
    // MARK: - Properties
    private var searchCompleter = MKLocalSearchCompleter()
    private var searchResults = [MKLocalSearchCompletion]()
    
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        return  view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "도시, 우편번호 또는 공항 위치 입력"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.becomeFirstResponder()
        searchBar.keyboardAppearance = .dark
        searchBar.showsCancelButton = false
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.leftView?.tintColor = UIColor.white.withAlphaComponent(0.5)
        searchBar.searchTextField.backgroundColor = .lightGray
        searchBar.searchTextField.textColor = .white
        searchBar.searchTextField.tintColor = .white
        searchBar.searchTextField.font = .systemFont(ofSize: 14, weight: .semibold)
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "검색",
                                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
        return searchBar
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("취소", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        return button
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    let searchTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelButton.addTarget(self, action: #selector(touchUpCancelButton), for: .touchUpInside)
        configUI()
        setupBlurEffect()
        setupAutoLayout()
        setupSearchBar()
        setupSearchCompleter()
        setupTableView()
    }
    
    // MARK: - Custom Method
    
    func configUI() {
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }
    
    func setupBlurEffect() {
        let blurEffect = UIBlurEffect(style: .dark)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = self.view.frame
        self.view.addSubview(visualEffectView)
        self.topView.addSubview(visualEffectView)
    }
    
    func setupAutoLayout() {
        self.view.addSubview(topView)
        self.view.addSubview(searchTableView)
        self.topView.addSubview(titleLabel)
        self.topView.addSubview(searchBar)
        self.topView.addSubview(cancelButton)
        self.topView.addSubview(lineView)
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            topView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 100),
            
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            searchBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            searchBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 6),
            searchBar.trailingAnchor.constraint(equalTo: cancelButton.leadingAnchor, constant: -2),
            searchBar.heightAnchor.constraint(equalToConstant: 40),
            
            cancelButton.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
            cancelButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            
            lineView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            lineView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            lineView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 0.5),
            
            searchTableView.topAnchor.constraint(equalTo: self.topView.bottomAnchor),
            searchTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            searchTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            searchTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
    
    func setupSearchBar() {
        searchBar.delegate = self
    }
    
    func setupSearchCompleter() {
        searchCompleter.delegate = self
        searchCompleter.resultTypes = .address
    }
    
    func setupTableView() {
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewCell")
        searchTableView.separatorStyle = .none
    }
    
    // MARK: - @objc
    
    @objc private func touchUpCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

    // MARK: - UITableViewDelegate
extension SearchViewController: UITableViewDelegate {
    /// 검색 결과 선택 시에 (취소/추가)버튼이 있는 VC이 보여야 함
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedResult = searchResults[indexPath.row]
        let searchReqeust = MKLocalSearch.Request(completion: selectedResult)
        let search = MKLocalSearch(request: searchReqeust)
        search.start { (response, error) in
            guard error == nil else {
                print(error.debugDescription)
                return
            }
            guard let placeMark = response?.mapItems[0].placemark else {
                return
            }
            let searchLatitude = placeMark.coordinate.latitude
            let searchLongtitude = placeMark.coordinate.longitude
            let vc = WeatherViewController()
            vc.addNewCityView = true
            vc.locationLatitude = searchLatitude
            vc.locationLongitude = searchLongtitude
            vc.modalPresentationStyle = .popover
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.searchBar.resignFirstResponder()
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell
        else { return UITableViewCell() }
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        if let highlightText = searchBar.text {
            cell.countryLabel.setHighlighted(searchResults[indexPath.row].title, with: highlightText)
        }
        return cell
    }
}

    // MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    // 검색창의 text가 변하는 경우에 searchBar가 delegate에게 알리는데 사용하는 함수
       func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
           // searchText를 queryFragment로 넘겨준다.
           searchCompleter.queryFragment = searchText
    }
}

// MARK: - MKLocalSearchCompleterDelegate
extension SearchViewController: MKLocalSearchCompleterDelegate {
    // 자동완성 완료 시에 결과를 받는 함수
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        // completer.results를 통해 검색한 결과를 searchResults에 담아줍니다
        searchResults = completer.results
        searchTableView.reloadData()
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        // 에러 확인
        print(error.localizedDescription)
    }
}
