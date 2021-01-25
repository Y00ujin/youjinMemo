//
//  ModifyMemoViewController.swift
//  youjinMemo
//
//  Created by 김유진 on 2021/01/25.
//

import UIKit

class ModifyMemoViewController: UIViewController{
    
    @IBOutlet weak var memoTitleTextField: UITextField!
    @IBOutlet weak var memoContentTextView: UITextView!

    let titleunwritealert = UIAlertController(title: "경고", message: "제목을 입력해주세요.", preferredStyle: UIAlertController.Style.alert)
    let contentunwritealert = UIAlertController(title: "경고", message: "내용을 입력해주세요.", preferredStyle: UIAlertController.Style.alert)
    let writetitle = UIAlertAction(title: "제목 입력하기", style: UIAlertAction.Style.default, handler: nil)
    let writecontent = UIAlertAction(title: "내용 입력하기", style: UIAlertAction.Style.default, handler: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memoTitleTextField.text = memoTitle[UserDefaults.standard.integer(forKey: "index")]
        memoContentTextView.text = memoContents[UserDefaults.standard.integer(forKey: "index")]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        memoTitleTextField.text = memoTitle[UserDefaults.standard.integer(forKey: "index")]
        memoContentTextView.text = memoContents[UserDefaults.standard.integer(forKey: "index")]
    }
    
    @IBAction func backButton(_ sender: Any) {
        if(memoTitleTextField.text == ""){
            present(titleunwritealert, animated: true, completion: nil)
        }else if(memoContentTextView.text == ""){
            present(contentunwritealert, animated: true, completion: nil)
        }else{
            memoTitle[UserDefaults.standard.integer(forKey: "index")] = memoTitleTextField.text!
            memoContents[UserDefaults.standard.integer(forKey: "index")] = memoContentTextView.text

        }
        
        self.navigationController?.popViewController(animated: true)
    }
}
   
