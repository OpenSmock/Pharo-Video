Class {
	#name : #BaselineOfVideo,
	#superclass : #BaselineOf,
	#category : #BaselineOfVideo
}

{ #category : #baselines }
BaselineOfVideo >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			"GStreamer"
			spec
				baseline: 'GStreamer'
				with: [ spec repository: 'github://OpenSmock/PharoGStreamer:main' ].

			"Video"
			spec package: 'Video'.
			spec package: 'Video-GStreamer' with: [ spec requires: 'GStreamer' ] ]
]
