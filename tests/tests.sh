#!/bin/bash

testIk() {
  assertNotValidXml "empty.xml"
  assertNotValidXml "ikEmpty.xml"
  assertNotValidXml "metaEmpty.xml"
  assertValidXml "onlyRequired.xml"
}

testMeta() {
  assertNotValidXml "ikWithoutMeta.xml"
  assertValidXml "metaAll.xml"
}

testGlossary() {
  assertNotValidXml "ikWithoutGlossary.xml"
  assertNotValidXml "glossaryTermNotUnique.xml"
  assertValidXml "glossaryAll.xml"
}

testTextType() {
  assertNotValidXml "textTypeWithoutGlossaryTerm.xml"
  assertValidXml "textTypeWithAll.xml"
}

testTaxons() {
  assertNotValidXml "ikWithoutTaxons.xml"
  assertNotValidXml "taxonWithoutName.xml"
  assertNotValidXml "taxonWithNotOneScientificName.xml"
  assertNotValidXml "taxonWithoutId.xml"
  assertNotValidXml "taxonWithoutUniqueId.xml"
  assertNotValidXml "taxonWithoutUniqueScientificName.xml"
  assertNotValidXml "taxonWithIncorrectParent.xml"
  assertValidXml "taxonOnlyRequired.xml"
  assertValidXml "taxonAll.xml"
}
