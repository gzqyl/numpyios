# NumPy-iOS

# We just need to add this package, it will auto add pyios ...

# Note, the python version should be 3.11, not update it for another higher version, the imp is deprectated which will be removed in higher version, that will make the things trouble in no meaning.


This swift package enables you to use NumPy in your iOS apps.

## Installation

```
.package(url: "https://github.com/kewlbear/NumPy-iOS.git", .branch("main"))
```

## Usage

```
import NumPySupport
import PythonSupport
import PythonKit

PythonSupport.initialize()
NumPySupport.sitePackageUrl.insertPythonPath()
let np = Python.import("numpy")
...
```

If you want to build XCFrameworks yourself, see https://github.com/kewlbear/kivy-ios.

## License

MIT
