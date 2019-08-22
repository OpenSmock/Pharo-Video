Extension { #name : #TestVideo }

{ #category : #'*Video-GStreamer' }
TestVideo >> launchGStreamerVideo [
	| stream |
	GStreamer isInit ifFalse: [ GStreamer init ].
	
	stream := WriteStream with: String new.
	stream << 'videotestsrc '.
	self pattern ifNotNil: [ stream << 'pattern=' << self pattern printString ].
	stream 	<< '! video/x-raw, framerate=' << self framerate printString
				<< '/1, width=' << self extent x printString
				<< ', height=' << self extent y printString
				<< ' ! videoconvert !' << GStreamer osSpecificVideoSink
				<< ' name=' 	<< VGStreamerHandle outputSinkName.

	^ GstParse launch: stream contents error: nil
]
