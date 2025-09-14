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
	self assert: (Frog new md5sum: '/tmp/smalltalk/empty.txt') equals: 'd41d8cd98f00b204e9800998ecf8427e' .
	
	
	
	
	
	
	
]

{ #category : 'tests' }
FrogTest >> testMD5sum [
	"md5sum on a file"
	self assert: (Frog new md5sum: '/home/terry/code/smalltalk/LICENSE') equals: 'b81f7ad15568a5844f69e360f0d64405' .
	
	"some stuff"
#(
c8dc00f395230ff7a0844e96db7c43e2  /home/terry/bin/cuis-smalltalk/Cuis-Smalltalk-Dev/.git/objects/pack/pack-61fe230b540d7d815ff049a3895f03c1f6657c11.pack
>
>>d330e882e3179d0d7926e7863d3576a4  /home/terry/bin/android/android-studio-2025.1.2.11-linux.tar.gz
>
>>e6f50fc996f47a96de85405325a20d2c  /home/terry/Android/Sdk/system-images/android-36/google_apis_playstore/x86_64/system.img
>
>>67ecea33f0bb5e5dbfd765b049fefc7c  /home/terry/.android/avd/Medium_Phone.avd/snapshots/default_boot/ram.img
>
>>f474529b8a34f4f8c81e562f2f3114d3  /home/terry/.android/avd/Medium_Phone.avd/userdata-qemu.img.qcow2
>	
).

	
	
	
]
