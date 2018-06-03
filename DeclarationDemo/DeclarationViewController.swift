//
//  DeclarationViewController.swift
//  DeclarationDemo
//
//  Created by Haoxin Li on 6/1/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import UIKit

protocol DeclarationViewControllerDelegate: class {
    func didSelect(title: DeclarationViewController.Title)
}

class DeclarationViewController: UIViewController {
    
    typealias Title = String
    
    fileprivate enum Section: Int {
        case one
        case two
        case three
        
        static let count = 3
    }
    
    // MARK: - open access
    
    open override var view: UIView! {
        get { return _privateSecretView }
        set {} // do nothing
    }
    open var anOpenVar = 7182
    
    // MARK: - public access
    
    public var aPublicVar = 6719
    
    // MARK: - internal access
    
    static let aStaticLet = 2176
    let aLet = 9012
    var aVar = 6721
    lazy var aLazyVar: Int = { return 1982 }()
    var aComputedVar: Int { return 2873 }
    
    // MARK: - fileprivate access
    
    fileprivate static let cellReuseID = "cellReuseID"
    fileprivate let dataSourceItems: [Title]
    fileprivate let aFileprivateLet = 1
    fileprivate lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero)
        tv.dataSource = self
        tv.delegate = self
        tv.register(UITableViewCell.self, forCellReuseIdentifier: DeclarationViewController.cellReuseID)
        return tv
    }()
    fileprivate unowned let delegate: DeclarationViewControllerDelegate
    fileprivate(set) var aFileprivateVar = 1
    
    // MARK: - private access
    
    private let _privateSecretView: UIView
    private let aPrivateLet = 1
    private(set) var aPrivateVar = 1
    @IBOutlet private weak var aDangerousPrivateView: UIView!
    
    // MARK: - init
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("not implemented")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("not implemented")
    }
    
    init(titles: [Title], delegate: DeclarationViewControllerDelegate) {
        dataSourceItems = titles
        self.delegate = delegate
        _privateSecretView = UIView(frame: UIScreen.main.bounds)
        _privateSecretView.backgroundColor = .yellow
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - override funcs
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        printSelf()
    }
}

// MARK: - API

extension DeclarationViewController {
    
    func refreshView() {
        tableView.reloadData()
        printSelf()
    }
}

// MARK: - UITableViewDataSource

extension DeclarationViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DeclarationViewController.cellReuseID, for: indexPath)
        cell.configure(with: dataSourceItems[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate

extension DeclarationViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didSelect(title: dataSourceItems[indexPath.row])
    }
}

// MARK: - private IBAction DeclarationViewController extension

private extension DeclarationViewController {
    
    @IBAction func actionOne() {
        printSelf()
    }
    
    @IBAction func actionTwo() {
        printSelf()
    }
}

// MARK: - private helper extensions DeclarationViewController

private extension DeclarationViewController {
    
    func printSelf() {
        print(self)
    }
}

// MARK: - private extensions of other types

private extension UITableViewCell {
    
    func configure(with title: DeclarationViewController.Title) {
        textLabel?.text = title
    }
}
