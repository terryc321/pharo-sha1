"
# Example


Sec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==
Guid: 258EAFA5-E914-47DA-95CA-C5AB0DC85B11

```
| key guid concatKeyGuid sha1 enc dict | 
key := 'dGhlIHNhbXBsZSBub25jZQ=='.
guid := '258EAFA5-E914-47DA-95CA-C5AB0DC85B11'.
""concatenate web socket key with globally unique identifier - fixed ?""
concatKeyGuid := key , guid .
""compute sha1 of concatenated headers""
sha1 := SHA1 new hashMessage: concatKeyGuid . 
""compute base64 encoding""
enc := ZnBase64Encoder new encode: sha1. 
""examine all the players ""
{ #key -> key . #guid -> guid . #concat -> concatKeyGuid . #sha1 -> sha1 . #enc -> enc} inspect . 
```


To prove that the handshake was received, the server has to take two
   pieces of information and combine them to form a response.  The first
   piece of information comes from the |Sec-WebSocket-Key| header field
   in the client handshake:

        Sec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==

   For this header field, the server has to take the value (as present
   in the header field, e.g., the base64-encoded [RFC4648] version minus
   any leading and trailing whitespace) and concatenate this with the
   Globally Unique Identifier (GUID, [RFC4122]) ""258EAFA5-E914-47DA-
   95CA-C5AB0DC85B11"" in string form, which is unlikely to be used by
   
   SHA-1 hash (160 bits) [FIPS.180-3], base64-encoded (see Section 4 of
   [RFC4648]), of this concatenation is then returned in the server's
   handshake.
Concretely, if as in the example above, the |Sec-WebSocket-Key|
   header field had the value ""dGhlIHNhbXBsZSBub25jZQ=="", the server
   would concatenate the string ""258EAFA5-E914-47DA-95CA-C5AB0DC85B11""
   to form the string ""dGhlIHNhbXBsZSBub25jZQ==258EAFA5-E914-47DA-95CA-
   C5AB0DC85B11"".  The server would then take the SHA-1 hash of this,
   giving the value 0xb3 0x7a 0x4f 0x2c 0xc0 0x62 0x4f 0x16 0x90 0xf6
   0x46 0x06 0xcf 0x38 0x59 0x45 0xb2 0xbe 0xc4 0xea.  This value is
   then base64-encoded (see Section 4 of [RFC4648]), to give the value
   ""s3pPLMBiTxaQ9kYGzzhZRbK+xOo="".  This value would then be echoed in
   the |Sec-WebSocket-Accept| header field.



```language=Pharo&caption=Beautiful&anchor=Fig1
   ""we can see what result of running sha1 over ""
(SHA1 new hashStream: 'The quick brown fox jumps over the lazy dog' readStream) hex.
```

generateGuid
UUID is same as GUID
universally unique identifier uuid
global unique identifier guid

changes made in pharo 12 .
changes made in pharo 14. 


md5: aString

md5sum: aFile 
aPositionableStream 
asFileReference

Lets try to dig deeper as to why md5sum over a file is taking so long, including using Streams

```
>md5sum /home/terry/.emacs.d/.cache/lsp/clojure/clojure-lsp.zip
db88b025fa0406b4fcc8eb652a0a7fdd  /home/terry/.emacs.d/.cache/lsp/clojure/clojure-lsp.zip
""Frog new profileMD5a . ""
MessageTally spyOn: [Frog new profileMD5a ].
```

profiling

Frog new profileMD5a . 
MessageTally spyOn: [Frog new profileMD5a ].

f := Frog new.
[ f profileMD5a ] timeToRun . ""0:00:00:07.476""

 7476 / 46 asFloat ""162.52173913043478""

f := Frog new.
r := nil.
MessageTally spyOn: [ r := f profileMD5b ] .

unfortunately looks like 66% percent time is spent on primitives 

 - 267909 tallies, 267909 msec.

**Tree**
--------------------------------
Process: (40) Morphic UI Process: nil
--------------------------------
66.7% {178592ms} Frog>>md5sum:
  66.7% {178592ms} FileReference(AbstractFileReference)>>binaryReadStreamDo:
    66.7% {178592ms} FullBlockClosure(BlockClosure)>>ensure:
      66.7% {178592ms} FileReference(AbstractFileReference)>>binaryReadStreamDo:
        66.7% {178592ms} Frog>>md5sum:
          66.7% {178592ms} MD5NonPrimitive(MD5)>>hashStream:
            66.1% {177122ms} MD5NonPrimitive>>processBuffer:
              61.9% {165813ms} MD5NonPrimitive>>rounds:
                |61.8% {165693ms} Array(Collection)>>doWithIndex:
                |  61.8% {165553ms} Array(SequenceableCollection)>>withIndexDo:
                |    61.3% {164307ms} MD5NonPrimitive>>rounds:
                |      61.2% {163908ms} MD5NonPrimitive>>round:selector:round:
                |        56.1% {150391ms} MD5NonPrimitive>>step:template:selector:
                |          |10.4% {27888ms} MD5NonPrimitive>>ffA:B:C:D:M:S:T:
                |          |  |3.7% {9884ms} primitives
                |          |  |3.3% {8952ms} MD5NonPrimitive>>fX:Y:Z:
                |          |  |  |1.5% {4039ms} ThirtyTwoBitRegister>>bitInvert
                |          |  |2.8% {7463ms} ThirtyTwoBitRegister>>+=
                |          |10.0% {26705ms} primitives
                |          |9.7% {25888ms} MD5NonPrimitive>>ggA:B:C:D:M:S:T:
                |          |  |3.6% {9602ms} primitives
                |          |  |3.2% {8641ms} MD5NonPrimitive>>gX:Y:Z:
                |          |  |  |1.5% {4030ms} ThirtyTwoBitRegister>>bitInvert
                |          |  |2.3% {6135ms} ThirtyTwoBitRegister>>+=
                |          |9.2% {24568ms} MD5NonPrimitive>>iiA:B:C:D:M:S:T:
                |          |  |3.5% {9400ms} primitives
                |          |  |3.0% {8034ms} MD5NonPrimitive>>iX:Y:Z:
                |          |  |  |1.5% {4095ms} ThirtyTwoBitRegister(FixedBitWidthRegister)>>bitXor:
                |          |  |2.2% {5773ms} ThirtyTwoBitRegister>>+=
                |          |8.9% {23891ms} MD5NonPrimitive>>hhA:B:C:D:M:S:T:
                |          |  |3.5% {9429ms} primitives
                |          |  |3.2% {8663ms} ThirtyTwoBitRegister>>+=
                |          |  |1.5% {3991ms} MD5NonPrimitive>>hX:Y:Z:
                |          |8.0% {21451ms} OrderedCollection>>at:
                |        5.0% {13517ms} primitives
              1.8% {4871ms} primitives
              1.2% {3316ms} ThirtyTwoBitRegister class(FixedBitWidthRegister class)>>new

**Leaves**

**Memory**
	old			+0 bytes
	young		+3,138,136 bytes
	used		+3,138,136 bytes
	free		-3,138,136 bytes

**GCs**
	full			0 totalling 0ms (0.0% uptime)
	incr		15496 totalling 2,780ms (1.0% uptime), avg 0.0ms
	tenures		0
	root table	0 overflows




"
Class {
	#name : 'Frog',
	#superclass : 'Object',
	#category : 'PBE-Pond',
	#package : 'PBE-Pond'
}

{ #category : 'Sha1' }
Frog >> bitsFromBytes: nBytes [
"how many bits from nBytes"
^ nBytes * 8 .


]

{ #category : 'Sha1' }
Frog >> generateGuid [
"make a globally unique identifier"
^ (ByteArray new: 16) generateUUIDInPlace . 


]

{ #category : 'Sha1' }
Frog >> handshake [
"test handshake for rfc example"
| key guid concatKeyGuid sha1 enc | 
key := 'dGhlIHNhbXBsZSBub25jZQ=='.
guid := '258EAFA5-E914-47DA-95CA-C5AB0DC85B11'.
"concatenate web socket key with globally unique identifier - fixed ?"
concatKeyGuid := key , guid .
"compute sha1 of concatenated headers"
sha1 := SHA1 new hashMessage: concatKeyGuid . 
"compute base64 encoding"
enc := ZnBase64Encoder new encode: sha1. 
^ enc .

]

{ #category : 'Sha1' }
Frog >> md5: aString [
"compute md5 from a byte array"
"hashStream aPositionable stream"
"we want a human readable hex representation in string as result"
|m|
m := MD5 new hashMessage:aString. 
^ m hex. 




]

{ #category : 'Sha1' }
Frog >> md5sum: aFilename [
"compute md5 from a file stream"
| md5 file res hash |
md5 := MD5 new.
"dat := '/tmp/smalltalk/pack-61fe230b540d7d815ff049a3895f03c1f6657c11.pack'."
file := aFilename asFileReference. 
res := nil.
file binaryReadStreamDo: [ :stream | 
     res := MD5 new hashStream: stream .
	 ].
^ res hex . 






]

{ #category : 'Sha1' }
Frog >> profileMD5a [
">time md5sum /home/terry/.emacs.d/.cache/lsp/clojure/clojure-lsp.zip
db88b025fa0406b4fcc8eb652a0a7fdd  /home/terry/.emacs.d/.cache/lsp/clojure/clojure-lsp.zip

real	0m0.046s
user	0m0.042s
sys	0m0.004s
	
pharo takes 7476  c takes 46  	, ""162.52173913043478 times slower ""
0:00:00:07.476	
	"	
^ (self md5sum: '/home/terry/.emacs.d/.cache/lsp/clojure/clojure-lsp.zip') = ('db88b025fa0406b4fcc8eb652a0a7fdd').



]

{ #category : 'Sha1' }
Frog >> profileMD5b [
"m5sum on a much much larger file" 
^ (self md5sum: '/home/terry/bin/cuis-smalltalk/Cuis-Smalltalk-Dev/.git/objects/pack/pack-61fe230b540d7d815ff049a3895f03c1f6657c11.pack') = ('c8dc00f395230ff7a0844e96db7c43e2').
"unix 
time md5sum /home/terry/bin/cuis-smalltalk/Cuis-Smalltalk-Dev/.git/objects/pack/pack-61fe230b540d7d815ff049a3895f03c1f6657c11.pack
c8dc00f395230ff7a0844e96db7c43e2  /home/terry/bin/cuis-smalltalk/Cuis-Smalltalk-Dev/.git/objects/pack/pack-61fe230b540d7d815ff049a3895f03c1f6657c11.pack

real	0m1.360s
user	0m1.279s
sys	0m0.082s
terry@terry-MS-7D96:~/code/smalltalk$ 
"

"
pharo smalltalk
- 280645 tallies, 280647 msec.

**Tree**
--------------------------------
Process: (40) Morphic UI Process: nil
--------------------------------
66.7% {187084ms} Frog>>md5sum:
  66.7% {187084ms} FileReference(AbstractFileReference)>>binaryReadStreamDo:
    66.7% {187084ms} FullBlockClosure(BlockClosure)>>ensure:
      66.7% {187084ms} FileReference(AbstractFileReference)>>binaryReadStreamDo:
        66.7% {187084ms} Frog>>md5sum:
          66.7% {187084ms} MD5NonPrimitive(MD5)>>hashStream:
            66.2% {185691ms} MD5NonPrimitive>>processBuffer:
              62.1% {174175ms} MD5NonPrimitive>>rounds:
                |62.0% {174135ms} Array(Collection)>>doWithIndex:
                |  61.9% {173750ms} Array(SequenceableCollection)>>withIndexDo:
                |    61.4% {172314ms} MD5NonPrimitive>>rounds:
                |      61.3% {172122ms} MD5NonPrimitive>>round:selector:round:
                |        55.3% {155229ms} MD5NonPrimitive>>step:template:selector:
                |          |11.1% {31062ms} primitives
                |          |10.0% {28197ms} MD5NonPrimitive>>ffA:B:C:D:M:S:T:
                |          |  |3.2% {9014ms} primitives
                |          |  |3.1% {8642ms} ThirtyTwoBitRegister>>+=
                |          |  |3.1% {8592ms} MD5NonPrimitive>>fX:Y:Z:
                |          |  |  1.0% {2914ms} ThirtyTwoBitRegister>>bitInvert
                |          |  |  1.0% {2895ms} ThirtyTwoBitRegister(FixedBitWidthRegister)>>bitAnd:
                |          |9.5% {26551ms} MD5NonPrimitive>>ggA:B:C:D:M:S:T:
                |          |  |3.2% {9051ms} primitives
                |          |  |3.0% {8383ms} MD5NonPrimitive>>gX:Y:Z:
                |          |  |  |1.0% {2877ms} ThirtyTwoBitRegister(FixedBitWidthRegister)>>bitAnd:
                |          |  |  |1.0% {2830ms} ThirtyTwoBitRegister>>bitInvert
                |          |  |2.6% {7293ms} ThirtyTwoBitRegister>>+=
                |          |8.9% {25083ms} MD5NonPrimitive>>iiA:B:C:D:M:S:T:
                |          |  |3.1% {8600ms} primitives
                |          |  |2.7% {7653ms} ThirtyTwoBitRegister>>+=
                |          |  |2.7% {7496ms} MD5NonPrimitive>>iX:Y:Z:
                |          |8.5% {23879ms} MD5NonPrimitive>>hhA:B:C:D:M:S:T:
                |          |  |3.2% {8873ms} primitives
                |          |  |3.0% {8353ms} ThirtyTwoBitRegister>>+=
                |          |  |1.7% {4670ms} MD5NonPrimitive>>hX:Y:Z:
                |          |7.3% {20456ms} OrderedCollection>>at:
                |        6.0% {16893ms} primitives
              1.5% {4232ms} primitives
              1.4% {4024ms} ThirtyTwoBitRegister class(FixedBitWidthRegister class)>>new
                1.1% {3150ms} ThirtyTwoBitRegister>>load:

**Leaves**
11.5% {32159ms} ThirtyTwoBitRegister>>+=
11.1% {31062ms} MD5NonPrimitive>>step:template:selector:
7.4% {20897ms} OrderedCollection>>at:
6.0% {16893ms} MD5NonPrimitive>>round:selector:round:
3.2% {9051ms} MD5NonPrimitive>>ggA:B:C:D:M:S:T:
3.2% {9014ms} MD5NonPrimitive>>ffA:B:C:D:M:S:T:
3.2% {8873ms} MD5NonPrimitive>>hhA:B:C:D:M:S:T:
3.1% {8600ms} MD5NonPrimitive>>iiA:B:C:D:M:S:T:
2.9% {8129ms} ThirtyTwoBitRegister>>bitInvert
2.5% {7090ms} ThirtyTwoBitRegister>>leftRotateBy:
2.1% {5772ms} ThirtyTwoBitRegister(FixedBitWidthRegister)>>bitAnd:
1.8% {5118ms} ThirtyTwoBitRegister(FixedBitWidthRegister)>>bitXor:
1.5% {4232ms} MD5NonPrimitive>>processBuffer:

**Memory**
	old			+0 bytes
	young		+11,604,152 bytes
	used		+11,604,152 bytes
	free		-11,604,152 bytes

**GCs**
	full			0 totalling 0ms (0.0% uptime)
	incr		15789 totalling 15,106ms (5.0% uptime), avg 1.0ms
	tenures		12,822 (avg 1 GCs/tenure)
	root table	0 overflows
"
]
