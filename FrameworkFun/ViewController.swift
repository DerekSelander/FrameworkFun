/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit
import SuperNeatOFramework

class ViewController: UIViewController {
  @IBOutlet weak var doggieImageView: UIImageView!
  let neatoClass = NeatOClass()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
//*****************************************************************
// MARK: - Section 0: Inspecting load commands in executable
//*****************************************************************
    
//*****************************************************************
// MARK: - Section 1: Dynamic linking
//*****************************************************************
    
//    let text = "hello, world"
//    let cstring = text.cString(using: .utf8)
//    let charArray = UnsafeMutablePointer<Int8>(mutating: cstring)
//    let count = strcnt(charArray)
//    print("Count of: \"\(text)\" is: \(count)")
    
//*****************************************************************
// MARK: - Section 2: Dlopen & Dlsym w/ Swift
//*****************************************************************
    
////    TODO: 1. What's the framework responsible for "strcat" C function?
//    let handle = dlopen("TODO", RTLD_NOW)
//    assert(handle != nil)
//    let strcat_address = dlsym(handle, "strcat")
//    
////     TODO: 2. How do we cast/call a method queried at runtime through Swift?
//    typealias strcatAlias = @convention(c)(UnsafeMutablePointer<Int8>, UnsafeMutablePointer<Int8>) -> UnsafeMutablePointer<Int8>
//
//    let strcat_function = unsafeBitCast(strcat_address, to: strcatAlias.self)
//    let cstr = strcat_function("hello".cstr, ", world".cstr)
//    let str = String(utf8String: cstr)!
//    print("\(str)")
    
//*****************************************************************
// MARK: - Section 3: Dlopen & Dlsym w/ Swift
//*****************************************************************
    
//    TODO: 3. Why can't you execute this method?
//    self.neatoClass.doCrazyCoolThing()
//    
//    let handle = dlopen(Bundle.main.privateFrameworksPath! + "/SuperNeatOFramework.framework/SuperNeatOFramework", RTLD_NOW)
//    assert(handle != nil)
//    
//    TODO: 4 What's the symbol name for this swift function?
//    let privateFunction = dlsym(handle, "TODO")
//    typealias privateFunctionAlias = @convention(c)(NeatOClass) -> Void
//    let doSuperCoolThing = unsafeBitCast(privateFunction, to: privateFunctionAlias.self)
//    doSuperCoolThing(self.neatoClass)

//*****************************************************************
// MARK: - Section 4: Exploring Private Frameworks
//*****************************************************************
    
////    TODO: 5 What's the location of the private frameworks directory on an actual iOS Device?
//    let privateFrameworks = try! FileManager.default.contentsOfDirectory(atPath: "TODO")
//    for framework  in privateFrameworks {
//      let name = framework.replacingOccurrences(of: ".framework", with: "")
//      let fullPath = "/System/Library/PrivateFrameworks/" + framework + "/" + name
//      dlopen(fullPath, RTLD_NOW)
//    }
//    print("*****************************\nDone!")
    
  }
}

//*****************************************************************
// MARK: - String Extensions
//*****************************************************************

extension String {
  var cstr: UnsafeMutablePointer<Int8> {
    return strdup(self.cString(using: .utf8))
  }
}

//*****************************************************************
// MARK: - UIView Extensions
//*****************************************************************

extension UIView {
  func overlay(view: UIView) {
    view.translatesAutoresizingMaskIntoConstraints = false
    view.contentMode = contentMode
    addSubview(view)
    
    NSLayoutConstraint.activate([
      view.centerXAnchor.constraint(equalTo: centerXAnchor),
      view.centerYAnchor.constraint(equalTo: centerYAnchor),
      view.widthAnchor.constraint(equalTo: widthAnchor),
      view.heightAnchor.constraint(equalTo: heightAnchor)
      ])
  }
}

