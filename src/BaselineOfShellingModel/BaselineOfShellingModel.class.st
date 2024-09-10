Class {
	#name : 'BaselineOfShellingModel',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfShellingModel',
	#package : 'BaselineOfShellingModel'
}

{ #category : 'baselines' }
BaselineOfShellingModel >> baseline: spec [

	<baseline>
	spec for: #common do: [

		"Packages"
		spec
			package: 'Shelling-Model';
			package: 'Shelling-Model-Tests' with: [ spec requires: #( 'Shelling-Model' ) ] ]
]
