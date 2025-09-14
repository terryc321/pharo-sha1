Class {
	#name : 'Frog',
	#superclass : 'Object',
	#category : 'Sha1',
	#package : 'PBE-Pond'
}

{ #category : 'Sha1' }
Frog >> test1 [
"test sha1 for rfc example"
^ (SHA1 new hashStream: 'The quick brown fox jumps over the lazy dog' readStream) hex.

]
