Class {
	#name : 'ShellingAgent',
	#superclass : 'CMAgent',
	#classInstVars : [
		'percentageOfSimilarAgentsWanted'
	],
	#category : 'Shelling-Model',
	#package : 'Shelling-Model'
}

{ #category : 'as yet unclassified' }
ShellingAgent class >> percentageOfSimilarAgentsWanted [
	<parameterFloatMin: 0 max: 1 default: 0.3>
	^ percentageOfSimilarAgentsWanted
]

{ #category : 'as yet unclassified' }
ShellingAgent class >> percentageOfSimilarAgentsWanted: aNumber [

	percentageOfSimilarAgentsWanted := aNumber
]

{ #category : 'testing' }
ShellingAgent >> isHappy [

	^ self numberOfSimilarNeighbours >= self numberOfSimilarNeighboursWanted
]

{ #category : 'accessing' }
ShellingAgent >> move [
	<action>
	self randomJumpConstrainedBy: [ :aCell | aCell hasNoOccupants ]
]

{ #category : 'as yet unclassified' }
ShellingAgent >> numberOfSimilarNeighbours [

	^ (self similarAgentsWithinRadius: 1) size
]

{ #category : 'as yet unclassified' }
ShellingAgent >> numberOfSimilarNeighboursWanted [

	^ (self class percentageOfSimilarAgentsWanted * self cell neighbourhood size) ceiling
]

{ #category : 'pov' }
ShellingAgent >> pov [
	
	^ CMPointOfView shape: #square size: (
		self isHappy
			ifTrue: [ 1 ]
			ifFalse: [ 0.5 ])
]

{ #category : 'control' }
ShellingAgent >> step [

	self isHappy ifFalse: [ self move ]
]
