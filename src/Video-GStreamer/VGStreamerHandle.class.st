Class {
	#name : #VGStreamerHandle,
	#superclass : #VideoHandle,
	#category : #'Video-GStreamer-Base'
}

{ #category : #'instance creation' }
VGStreamerHandle class >> handle: aHandle [
	^ self new handle: aHandle
]

{ #category : #constants }
VGStreamerHandle class >> outputSinkName [
	^ 'outputsink'
]

{ #category : #API }
VGStreamerHandle >> currentTime [
	| buffer |
	buffer := FFIInt64 newBuffer.
	^ (self handle queryDuration: buffer format: GstFormat GST_FORMAT_TIME)
		ifTrue: [ | uSec | 
			uSec := buffer integerAt: 1 size: FFIInt64 externalTypeSize signed: false.
			GstClock GST_TIME_AS_SECONDS: uSec ]
		ifFalse: [ nil ].
]

{ #category : #API }
VGStreamerHandle >> drawRectangle: aRectangle [
	| videoOverlay |
	videoOverlay := GstVideoOverlay fromHandle: self getOutputSink.
	videoOverlay setRenderRectangle: aRectangle.
]

{ #category : #API }
VGStreamerHandle >> duration [
	| buffer |
	buffer := FFIInt64 newBuffer.
	^ (self handle queryDuration: buffer format: GstFormat GST_FORMAT_TIME)
		ifTrue: [ | uSec | 
			uSec := buffer integerAt: 1 size: FFIInt64 externalTypeSize signed: false.
			GstClock GST_TIME_AS_SECONDS: uSec ]
		ifFalse: [ nil ].
]

{ #category : #accessing }
VGStreamerHandle >> getOutputSink [
	^ (handle asGstBin getByName: self outputSinkName) asGstBaseSink
]

{ #category : #constants }
VGStreamerHandle >> outputSinkName [
	^ 'outputsink'
]

{ #category : #API }
VGStreamerHandle >> pause [
	handle setState: GstState GST_STATE_PAUSED
]

{ #category : #API }
VGStreamerHandle >> play [
	handle setState: GstState GST_STATE_PLAYING 
]

{ #category : #API }
VGStreamerHandle >> resize: aRectangle [
	self getOutputSink asGstVideoOverlay setRenderRectangle: aRectangle
]

{ #category : #API }
VGStreamerHandle >> screenshot: aFilename [
	| sample stream element pipeline appSrc |
	sample := self getOutputSink getLastSample.
	
	stream := WriteStream with: String new.
	stream 
		<< 'appsrc name=source num-buffers==1 ! jpegenc ! filesink name=sink location=' 
		<< aFilename.
		
	element := GstParse launch: stream contents error: nil.
	pipeline := GstPipeline fromHandle: element handle.
	appSrc := GstAppSrc fromHandle: (pipeline getByName: 'source').
	appSrc pushSample: sample.
	appSrc unref.
	
]

{ #category : #API }
VGStreamerHandle >> setWindow: aWindowId [
	self getOutputSink asGstVideoOverlay setWindowHandle: (ExternalAddress fromAddress: aWindowId).
]

{ #category : #API }
VGStreamerHandle >> stop [
	handle setState: GstState GST_STATE_NULL
]
