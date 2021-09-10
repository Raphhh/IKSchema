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
