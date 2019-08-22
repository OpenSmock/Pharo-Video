Class {
	#name : #NoneVideoLibrary,
	#superclass : #VideoLibrary,
	#category : #'Video-Utilities'
}

{ #category : #testing }
NoneVideoLibrary class >> isSupported [
	"Yep, i am always supported"
	^ true
]

{ #category : #video }
NoneVideoLibrary >> launchVideo: aVideo [
	^ NullVideoHandle new
		video: aVideo; 
		yourself
]

{ #category : #video }
NoneVideoLibrary >> loadVideo: aVideo type: aVideoType [
	^ NullVideoHandle new
		video: aVideo; 
		type: aVideoType;
		yourself
]

{ #category : #testing }
NoneVideoLibrary >> noVideoLibrary [
	^ true
]
