Extension { #name : #NetworkVideo }

{ #category : #'*Video-GStreamer' }
NetworkVideo >> launchGStreamerVideo [
	| stream |
	GStreamer isInit ifFalse: [ GStreamer init ].
			
	stream := WriteStream with: String new.
	stream << 'udpsrc uri=udp://' << ip
			 << ':' << port printString
			 << ' ! video/mpegts ! tsdemux name=demux ! video/x-h264 ! queue ! decodebin ! videoconvert'
			 << ' ! videoscale ! '
			 << GStreamer osSpecificVideoSink 
			 << ' name='
			 << VGStreamerHandle outputSinkName.
	
	^ GstParse launch: stream contents error: nil
]
