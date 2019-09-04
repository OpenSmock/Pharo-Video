Class {
	#name : #Video,
	#superclass : #Object,
	#instVars : [
		'videoHandle',
		'type',
		'name',
		'preferableLibrary',
		'launched'
	],
	#category : #'Video-Base'
}

{ #category : #'instance creation' }
Video class >> fromFile: aFilename [
	^ self basicNew 
		initialize;
		initFilename: aFilename
]

{ #category : #'instance creation' }
Video class >> fromIP: ipAddress port: aNumber [
	^ self withType: (NetworkVideo new initIp: ipAddress port: aNumber)
]

{ #category : #'instance creation' }
Video class >> new [
	^ self shouldNotImplement 
]

{ #category : #examples }
Video class >> test [
	<script>
	| video | 
	video := self withType: (TestVideo new
			pattern: 1;
			framerate: 60;
			extent: 800@600;
			yourself).
	video launch.
	video play.
]

{ #category : #'instance creation' }
Video class >> withType: aVideoType [
	^ self basicNew initialize; initWith: aVideoType
]

{ #category : #API }
Video >> currentTime [
	^ videoHandle currentTime
]

{ #category : #API }
Video >> duration [
	^ videoHandle duration
]

{ #category : #'private - initialization' }
Video >> initFilename: aFilename [
	type := FileVideo filename: aFilename.
]

{ #category : #'private - initialization' }
Video >> initIp: aString port: aNumber [
	type := NetworkVideo ip: aString port: aNumber.
]

{ #category : #'private - initialization' }
Video >> initWith: aVideoType [
	type := aVideoType
]

{ #category : #testing }
Video >> isLaunched [
	^ self launched
]

{ #category : #API }
Video >> launch [
	videoHandle ifNotNil: [ self error: 'The video already exists.' ].
	
	videoHandle := ( preferableLibrary
		ifNil: [ preferableLibrary := VideoLibrary current ])
		launchVideo: self.
		
	launched := true.
]

{ #category : #accessing }
Video >> launched [
	^ launched ifNil: [ launched := false ]
]

{ #category : #API }
Video >> pause [
	videoHandle pause
]

{ #category : #API }
Video >> play [
	videoHandle play
]

{ #category : #API }
Video >> position: anExtent [
	self flag: 'toImplement'
]

{ #category : #API }
Video >> remainingTime [
	self flag: 'toImplement'
]

{ #category : #API }
Video >> resize: anExtent [
	videoHandle resize: anExtent
]

{ #category : #API }
Video >> setWindow: anId [
	videoHandle setWindow: anId
]

{ #category : #API }
Video >> stop [
	videoHandle stop.
	launched := false.
]

{ #category : #API }
Video >> time: aDuration [
	self flag: 'toImplement'
]

{ #category : #API }
Video >> timePercent: aFloat [
	self flag: 'toImplement'
]

{ #category : #accessing }
Video >> type [
	^ type ifNil: [ self error: 'Video must have a type.' ]
]
