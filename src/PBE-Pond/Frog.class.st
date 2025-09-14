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

UUID is same as GUID
universally unique identifier uuid
global unique identifier guid


"
Class {
	#name : 'Frog',
	#superclass : 'Object',
	#category : 'PBE-Pond',
	#package : 'PBE-Pond'
}

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

