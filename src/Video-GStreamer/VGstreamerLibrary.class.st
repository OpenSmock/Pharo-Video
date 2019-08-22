Class {
	#name : #VGstreamerLibrary,
	#superclass : #VideoLibrary,
	#instVars : [
		'handle'
	],
	#category : #'Video-GStreamer-Base'
}

{ #category : #testing }
VGstreamerLibrary class >> isSuitable [
	^ self isSupported
]

{ #category : #testing }
VGstreamerLibrary class >> isSupported [
	^ GStreamer isAvailable
]

{ #category : #video }
VGstreamerLibrary >> launchVideo: aVideo [
	^ VGStreamerHandle handle: aVideo type launchGStreamerVideo
]
