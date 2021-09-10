#!/bin/bash

testIk() {
  assertNotValidXml "empty.xml"
  assertNotValidXml "ikEmpty.xml"
}

testMeta() {
  assertNotValidXml "metaEmpty.xml"
  assertValidXml "metaRequired.xml"
  assertValidXml "metaAll.xml"
}
