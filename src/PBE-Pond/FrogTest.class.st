Class {
	#name : 'FrogTest',
	#superclass : 'TestCase',
	#category : 'PBE-Pond',
	#package : 'PBE-Pond'
}

{ #category : 'tests' }
FrogTest >> testHandshake [   
	" test sha1 working as expected ignore all the base64 encoded notes "
	"test did not pass - maybe something to do with base64 encoding?"
	| out expected |
	out := Frog new handshake . 
	expected := 's3pPLMBiTxaQ9kYGzzhZRbK+xOo='.
	self assert: out equals: expected.
	
	
	
	
	
]
