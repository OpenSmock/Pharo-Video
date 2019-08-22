Class {
	#name : #FileVideo,
	#superclass : #VideoType,
	#instVars : [
		'filename'
	],
	#category : #'Video-Base'
}

{ #category : #'instance creation' }
FileVideo class >> filename: aFilename [
	^ self new initFilename: aFilename
]

{ #category : #initialization }
FileVideo >> initFilename: aFilename [
	filename := aFilename
]
