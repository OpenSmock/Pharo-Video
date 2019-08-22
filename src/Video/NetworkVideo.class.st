Class {
	#name : #NetworkVideo,
	#superclass : #VideoType,
	#instVars : [
		'ip',
		'port'
	],
	#category : #'Video-Base'
}

{ #category : #'instance creation' }
NetworkVideo class >> ip: aString port: aNumber [ 
	^ self new initIp: aString port: aNumber
]

{ #category : #initialization }
NetworkVideo >> initIp: anIp port: aNumber [
	ip := anIp.
	port := aNumber
]
