Extension { #name : #FileVideo }

{ #category : #'*Video-GStreamer' }
FileVideo >> launchGStreamerVideo [
	| stream |
	GStreamer isInit ifFalse: [ GStreamer init ].
			
	stream := WriteStream with: String new.
	stream << ':= ''filesrc location=' << filename printString
			 << ' ! qtdemux name=demux demux. ! queue ! decodebin ! videoconvert ! '
			 << GStreamer osSpecificVideoSink 
			 << ' name='
			 << VGStreamerHandle outputSinkName.
	
	^ GstParse launch: stream contents error: nil
]
