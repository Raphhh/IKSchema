#!/bin/bash

testIk() {
  assertNotValidXml "empty.xml"
  assertValidXml "1.xml"
}
