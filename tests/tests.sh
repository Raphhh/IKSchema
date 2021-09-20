#!/bin/bash

testIk() {
  assertNotValidXml "empty.xml"
  assertNotValidXml "ikEmpty.xml"
  assertNotValidXml "metaEmpty.xml"
  assertValidXml "onlyRequired.xml"
  assertValidXml "../../example.xml"
}

testMeta() {
  assertNotValidXml "ikWithoutMeta.xml"
  assertValidXml "metaAll.xml"
}

testGlossary() {
  assertNotValidXml "ikWithoutGlossary.xml"
  assertNotValidXml "glossaryWithoutDefinition.xml"
  assertNotValidXml "glossaryWithoutTitle.xml"
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


testKey() {
  assertNotValidXml "ikWithoutKey.xml"
  assertNotValidXml "keyEmpty.xml"
  assertNotValidXml "keyWithoutTermMatch.xml"
  assertNotValidXml "keyWithOnlyOneChoice.xml"
  assertNotValidXml "keyWithoutQuestion.xml"
  assertNotValidXml "keyWithoutResult.xml"
  assertNotValidXml "keyWithEmptyResult.xml"
  assertNotValidXml "keyWithIncorrectResult.xml"
  assertNotValidXml "keyWithoutValue.xml"
  assertNotValidXml "keyWithoutUniqueValue.xml"
  assertValidXml "keyAll.xml"
}
