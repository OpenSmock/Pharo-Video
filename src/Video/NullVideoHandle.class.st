Class {
	#name : #NullVideoHandle,
	#superclass : #VideoHandle,
	#category : #'Video-Utilities'
}

{ #category : #API }
NullVideoHandle >> currentTime [
	^ 0 second
]

{ #category : #API }
NullVideoHandle >> drawRectangle: aRectangle [
]

{ #category : #API }
NullVideoHandle >> duration [
	^ 0 second
]

{ #category : #API }
NullVideoHandle >> pause [
]

{ #category : #API }
NullVideoHandle >> play [
]

{ #category : #API }
NullVideoHandle >> remainingTime [
	^ 0 second
]

{ #category : #API }
NullVideoHandle >> resize: anExtent [
]

{ #category : #API }
NullVideoHandle >> screenshot: aFilename [
]

{ #category : #API }
NullVideoHandle >> setWindow: anId [
]

{ #category : #API }
NullVideoHandle >> stop [
]
