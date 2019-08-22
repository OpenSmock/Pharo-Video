Class {
	#name : #VideoHandle,
	#superclass : #Object,
	#instVars : [
		'handle',
		'video'
	],
	#category : #'Video-Utilities'
}

{ #category : #API }
VideoHandle >> currentTime [
	self subclassResponsibility 
]

{ #category : #API }
VideoHandle >> drawRectangle: aRectangle [
	self subclassResponsibility 
]

{ #category : #API }
VideoHandle >> duration [
	self subclassResponsibility 
]

{ #category : #accessing }
VideoHandle >> handle [
	^ handle
]

{ #category : #accessing }
VideoHandle >> handle: anObject [
	handle := anObject
]

{ #category : #API }
VideoHandle >> pause [
	self subclassResponsibility 
]

{ #category : #API }
VideoHandle >> play [
	self subclassResponsibility 
]

{ #category : #API }
VideoHandle >> remainingTime [
	self subclassResponsibility 
]

{ #category : #API }
VideoHandle >> resize: anExtent [
	self subclassResponsibility 
]

{ #category : #API }
VideoHandle >> screenshot: aFilename [
	self subclassResponsibility 
]

{ #category : #API }
VideoHandle >> setWindow: anId [
	self subclassResponsibility 
]

{ #category : #API }
VideoHandle >> stop [
	self subclassResponsibility 
]

{ #category : #accessing }
VideoHandle >> video [
	^ video
]

{ #category : #accessing }
VideoHandle >> video: anObject [
	video := anObject
]
