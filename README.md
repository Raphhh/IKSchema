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
    - description (textType)
    - image

#### `glossary`

Glossary with definitions of specific terms.
Each term must be unique.
Refer to a `term` from any `textType` with the element `term` (by its `id`).

Example:

```xml
<glossary>
    <term id="fooID">
        <title>foo term</title>
        <definition>the foo definition 1</definition>
        <definition>the foo definition 2</definition>
        ...
        <image uri="uri 1">image 1 legend</image>
        <image uri="uri 2">image 2 legend</image>
        ...
    </term>
</glossary>
```
```xml
<taxons>
    <taxon>
        ...
        <description>something about <term ref="fooID">foo</term></description>
    </taxon>
</taxons>
```

#### `taxons`

List of `taxon` elements.


#### `taxon`

Taxonomic entity.

##### Attributes

###### `type`

Following the [nomenclature codes](https://en.wikipedia.org/wiki/Nomenclature_codes), a `taxon` has to be one of the following types:

 - `species`
 - `genus`
 - `family`
 - `order`
 - `class`
 - `phylum`
 - `kingdom`
 - `kingdom`
 - `domain`

For example:
```xml
<taxon id="leucanthemum_vulgare" type="species">
    <scientificName>Leucanthemum vulgare</scientificName>
</taxon>
```

###### `parent`

Each `taxon` should refer to its parent taxon (by its parent `id`).
For example, a species should refer to its genus and a genus to its family.

For example:
```xml
<taxons>
    <taxon id="asteraceae" type="family">
        <scientificName>Asteraceae</scientificName>
    </taxon>
    <taxon id="leucanthemum" type="genus" parent="asteraceae">
        <scientificName>Leucanthemum</scientificName>
    </taxon>
    <taxon id="leucanthemum_vulgare" type="species" parent="leucanthemum">
        <scientificName>Leucanthemum vulgare</scientificName>
    </taxon>
</taxons>
```

##### Children elements

###### `taxid`

Optional. For species only. See https://en.wikipedia.org/wiki/Species#Identification_codes.

###### Names

At least, one (and only one) `scientificName`.
Other scientific names must be `synonymName` elements.
Other non-scientific names, like for example translations in current language, are `commonName` elements.

For example:
```xml
<taxon id="asteraceae" type="family">
    <scientificName>Asteraceae</scientificName>
    <synonymName>Compositae</synonymName>
    <commonName>Sunflower family</commonName>
</taxon>
```

###### `description`

Optional `textType`. For all. (For species, see https://en.wikipedia.org/wiki/Species_description.) 


 - `source` and `uri`

Could refer to its source by the optional attributes `source` (for the name of the source) and `uri` (for the uri of the source).

For example:
```xml
<taxon id="leucanthemum_vulgare" type="species">
    <scientificName>Leucanthemum vulgare</scientificName>
    <description source="Lamarque, Flore fran??oise (1778)">Sa tige est haute ...</description>
</taxon>
```

May be empty and refers only to its source.

For example:
```xml
<taxon id="asteraceae" type="family">
    <scientificName>Asteraceae</scientificName>
    <description source="Wikipedia" uri="https://en.wikipedia.org/wiki/Asteraceae" />
</taxon>
```


###### `indication`

For example:
```xml
<taxon id="leucanthemum_vulgare" type="species">
    <scientificName>Leucanthemum vulgare</scientificName>
    <indication name="habitat">Europe</indication>
</taxon>
```


###### `period`

For example:
```xml
<taxon id="leucanthemum_vulgare" type="species">
    <scientificName>Leucanthemum vulgare</scientificName>
    <!-- first bloom half May and June -->
    <period name="bloom" unit="month">
        <from>5.5</from>
        <to>6</to>
    </period>
    <!-- second bloom September -->
    <period name="bloom" unit="month">
        <from>9</from>
        <to>9</to>
    </period>
</taxon>
```

###### `range`

For example:
```xml
<taxon id="leucanthemum_vulgare" type="species">
    <scientificName>Leucanthemum vulgare</scientificName>
    <range name="capitulum size" unit="mm">
        <from>10</from>
        <to>20</to>
    </range>
</taxon>
```

###### `image`

Illustration of the taxon.
```xml
<image uri="uri">image legend</image>
```


#### `key`

Contains the tree of choices to identify a taxon.

For example:

```xml
<taxons>
    <taxon type="species" id="taxon_1">
        <scientificName>The happy and healthy taxon</scientificName>
        <!-- The choices path to this taxon is "happy/healthy" -->
    </taxon>
    <taxon type="species" id="taxon_2">
        <scientificName>The unhappy or tired taxon</scientificName>
        <!-- The choices path to this taxon is "unhappy" or "happy/tired" -->
    </taxon>
</taxons>

<key name="happiness level">
    <choice value="happy">
        <question>Does it look like happy?</question>
        <result>
            <key name="health level">
                <choice value="healthy">
                    <question>Does it look like healthy?</question>
                    <result>
                        <taxon ref="taxon_1"/>
                    </result>
                </choice>
                <choice value="tired">
                    <question>Does it look like tired?</question>
                    <result>
                        <taxon ref="taxon_2"/>
                    </result>
                </choice>
            </key>
        </result>
    </choice>
    <choice value="unhappy">
        <question>Does it look like <b>un</b>happy?</question>
        <result>
            <taxon ref="taxon_2"/>
        </result>
    </choice>
</key>
```

##### Children elements

###### `choice`

Define an alternative between at least two questions.
Each `choice` must specify a `question` and a `result`.
Attribute `value` determines a unique path through the tree.

###### `question`

A `textType` where is defined the question choice to contribute to the identification of the taxon.


###### `result`

Must be either a new `key` or a `taxon`.

 - `key` is a new sub-branch of the tree.
- `taxon` is the end of the tree. This means`taxon` must refer to a `taxon` (by its `id`) defined in `taxons`.

###### `image`

Illustration of the question.
```xml
<image uri="uri">image legend</image>
```


#### `textType`

An element with mixed text and following elements:

- `term`

Could refer to glossary terms. See `glossary`.

- `i`

See https://developer.mozilla.org/en-US/docs/Web/HTML/Element/i. For example, latin expressions should be wrapped inside `i` element.


- `b`

See https://developer.mozilla.org/en-US/docs/Web/HTML/Element/b.


- `link

Reference to an external link.
