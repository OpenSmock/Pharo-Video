Class {
	#name : #VideoLibrary,
	#superclass : #Object,
	#classVars : [
		'Current',
		'LibraryClass',
		'Session'
	],
	#category : #'Video-Utilities'
}

{ #category : #accessing }
VideoLibrary class >> current [
	Session == Smalltalk session
		ifTrue: [ ^ Current ifNil: [ Current := self libraryClass new ] ].
	Session := Smalltalk session.
	^ Current := self libraryClass new
]

{ #category : #'class initialization' }
VideoLibrary class >> initialize [
	SessionManager default registerSystemClassNamed: self name
]

{ #category : #testing }
VideoLibrary class >> isSuitable [
	"Answer true if receiver is most suitable for using in current session/platform"
	^ false
]

{ #category : #testing }
VideoLibrary class >> isSupported [
	^ false
]

{ #category : #settings }
VideoLibrary class >> libraryClass [
	^ LibraryClass ifNil: [ LibraryClass := self pickLibraryClass ]
]

{ #category : #settings }
VideoLibrary class >> libraryClass: aClass [
	self libraryClass = aClass
		ifTrue: [ ^ self ].
	LibraryClass := aClass.
	Current := nil.
	self
		inform: 'You need to restart your image for this changes to take effect.'
]

{ #category : #settings }
VideoLibrary class >> pickLibraryClass [
	self
		subclassesDo: [ :s | 
			s isSuitable
				ifTrue: [ ^ s ] ].
	^ NoneVideoLibrary 
]

{ #category : #video }
VideoLibrary >> launchVideo: aVideo [
	self subclassResponsibility 
]

{ #category : #testing }
VideoLibrary >> noVideoLibrary [
	^ false
]
