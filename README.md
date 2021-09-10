# IK XML Schema

## Introduction

The IK schema describe the XML syntax for biological [identification key](https://en.wikipedia.org/wiki/Identification_key) documents.

Schema definided in the file `./ik.xsd`.
Example set in the file `./example.xml`.


## Dev

Install `libxml2-utils` as dependency to be able to use the command `xmllint` (see http://xmlsoft.org/xmllint.html).

### Validating an XML file

 ```shell
 $ bin/validate my_file.xml
 ```

### Testing

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

#### `meta`

Indication about ik context:

    - version
    - date (ISO 8601)
    - reference (URI) (required)
    - language (RFC 1766) (required)
    - title (required)
    - authors
    - description
    - image

#### `glossary`

Glossary with definitions of specific terms. Each term must be unique. Refer to the term with the element `term`.

Example:

```xml
<glossary>
    <definition term="fooID">the foo definition</definition>
</glossary>
```
```xml
<taxons>
    <taxon>
        <description>something about <term ref="fooID">foo term</term></description>
    </taxon>
</taxons>
```
