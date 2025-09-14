Class {
	#name : 'FrogTest',
	#superclass : 'TestCase',
	#category : 'PBE-Pond',
	#package : 'PBE-Pond'
}

{ #category : 'tests' }
FrogTest >> testBitsFromBytes [
	" 16 bytes expect 128 bits "
	self assert: (Frog new bitsFromBytes: 16) equals: 128 .
	
	
	
	
	
	
]

{ #category : 'tests' }
FrogTest >> testHandshake [   
	" test sha1 working as expected ignore all the base64 encoded notes "
	"test did not pass - maybe something to do with base64 encoding?"
	| out expected |
	out := Frog new handshake . 
	expected := 's3pPLMBiTxaQ9kYGzzhZRbK+xOo='.
	self assert: out equals: expected.
	
	
	
	
	
]

{ #category : 'tests' }
FrogTest >> testMD5 [
	" check md5 returned is correct "
	"tribute https://en.wikipedia.org/wiki/MD5 "
	self assert: (Frog new md5: 'The quick brown fox jumps over the lazy dog') equals: '9e107d9d372bb6826bd81d3542a419d6' .
	self assert: (Frog new md5: 'The quick brown fox jumps over the lazy dog.') equals: 'e4d909c290d0fb1ca068ffaddf22cbd0' .
	self assert: (Frog new md5: '') equals: 'd41d8cd98f00b204e9800998ecf8427e' .
	
	
	
	
	
	
	
]
