Class {
	#name : 'MyLearning',
	#superclass : 'Object',
	#category : 'Sha1-Examples',
	#package : 'Sha1-Examples'
}

{ #category : 'tests' }
MyLearning >> test1 [
"test sha1 for rfc example"
^ (SHA1 new hashStream: 'The quick brown fox jumps over the lazy dog' readStream) hex.

]
