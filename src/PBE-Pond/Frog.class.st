"
```language=Pharo&caption=Beautiful&anchor=Fig1
   ""we can see what result of running sha1 over ""
(SHA1 new hashStream: 'The quick brown fox jumps over the lazy dog' readStream) hex.
```
"
Class {
	#name : 'Frog',
	#superclass : 'Object',
	#category : 'PBE-Pond',
	#package : 'PBE-Pond'
}

{ #category : 'Sha1' }
Frog >> test1 [
"test sha1 for rfc example"
^ (SHA1 new hashStream: 'The quick brown fox jumps over the lazy dog' readStream) hex.

]
