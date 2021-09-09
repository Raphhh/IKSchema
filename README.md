# IK XML Schema

## Introduction

The IK schema describe the XML syntax for biological [identification key](https://en.wikipedia.org/wiki/Identification_key) documents.

Schema definided in the file `./ik.xsd`.
Example set in the file `./example.xml`.


## Dev

### Testing

Install `libxml2-utils` as dependency to be able to use the command `xmllint` (see http://xmlsoft.org/xmllint.html).

Run the tests:

 ```shell
 $ bin/unit
 ```

## Documentation


### Elements
 
#### `ik`

Root element of the document, specifying the current IK schema.

```xml
<ik 
	xmlns="https://github.com/Raphhh/IKSchema"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="https://github.com/Raphhh/ik/ik.xsd">
	
	...
	
</ik>
```
 	
