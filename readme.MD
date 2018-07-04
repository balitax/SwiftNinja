## SWIFTNINJA

An amazing swift extension for your project. 

## Build status

[![Build Status](https://travis-ci.org/balitax/SwiftNinja.svg?branch=master)](https://travis-ci.org/balitax/SwiftNinja/)


## Features
- Alamofire Global Function
- SDWebImage Global Function
- Reachability Global Function
- Date Helper

## Soon
- More Extension


## Code Example

```ruby

- Ninja Fire
NinjaFire.shared.request(<#T##url: String##String#>, method: <#T##HTTPMethod#>, encoding: <#T##ParameterEncoding#>, completion: <#T##(Data) -> ()#>, failure: <#T##(NinjaError) -> ()#>)

- Ninja Image
NinjaImage.shared.setImage(<#T##imageView: UIImageView##UIImageView#>, url: <#T##URL#>, placeholder: <#T##UIImage#>)

- Ninja Date
NinjaDate.shared.convertDateStringToString(date: <#T##String#>, format: <#T##DateFormat#>)

- Ninja Reachability
 NinjaReachability.isConnectedToNetwork() // Bool

```

## Installation
```ruby
drag and drop SwiftNinja.framework to your project
```

## API Reference

- [Alamofire] (https://github.com/Alamofire/Alamofire)
- [SDWebImage] (https://github.com/rs/SDWebImage)


## Contribute
- Soon

## License

Copyright 2018 Agus Cahyono

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

MIT © [Agus Cahyono]()
