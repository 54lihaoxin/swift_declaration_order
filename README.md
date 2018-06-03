# Swift Declaration Order

This is a demo project for my opinion of the order of declarations in a Swift source file. For me, access modifier is the first thing to consider.

[See the demo source file here.](DeclarationDemo/DeclarationViewController.swift)

First, regarding to the whole file, the order is:
- Type alias.
- Protocols.
- Small dependency types (enum / struct / class). Probably should put them into their own files.
- The main type (enum / struct / class) implementation, such as `class MyClass` in *MyClass.swift*.  
  - Type alias.
  - Embedded types (enum / struct / class).
  - Properties, including computed vars. See the next section.
  - Inits (requried > override > convenience > custom).
  - Override funcs. 
- Extension of the API / behavior of this type. Non-overriding funcs should be here.   
- Extensions for conforming to some protocols, such as `UITableViewDataSource` and `UITableViewDelegate`.  Each extension should conform to only one protocol.
- Extensions of other types defined in this file, such as the embedded types.
- Private extension with only `@IBAction func` in it for the main type.
- Private extensions for private helper funcs of the main type.
- Private extensions of other types defined in this file.
- Private extensions of other types defined in other files, such as `private extension String`.

Secondly, regarding to properties, the order of priorities is:
- open override > open > public override > public > internal override > internal > fileprivate > fileprivate(set) > private > private(set)
- let >  var
- static > non-static
- stored > lazy > computed
- strong > weak > unowned
- non-IBOutlet > IBOutlet
