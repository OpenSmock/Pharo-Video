Class {
	#name : #TestVideo,
	#superclass : #VideoType,
	#instVars : [
		'pattern',
		'framerate',
		'extent'
	],
	#category : #'Video-Base'
}

{ #category : #defaults }
TestVideo >> defaultExtent [
	^ 800@600
]

{ #category : #defaults }
TestVideo >> defaultFramerate [
	^ 60
]

{ #category : #accessing }
TestVideo >> extent [
	^ extent ifNil: [ extent := self defaultExtent ]
]

{ #category : #accessing }
TestVideo >> extent: anObject [
	extent := anObject
]

{ #category : #accessing }
TestVideo >> framerate [
	^ framerate ifNil: [ framerate := self defaultFramerate ]
]

{ #category : #accessing }
TestVideo >> framerate: anObject [
	framerate := anObject
]

{ #category : #accessing }
TestVideo >> pattern [
	^ pattern
]

{ #category : #accessing }
TestVideo >> pattern: anObject [
	pattern := anObject
]
