Class {
	#name : 'ShellingAgent',
	#superclass : 'CMAgent',
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#classInstVars : [
		'neighbourhoodSize',
		'percentageOfSimilarAgentsWanted'
	],
	#category : 'Shelling-Model',
	#package : 'Shelling-Model'
}

{ #category : 'initialization' }
ShellingAgent class >> initializeParameters [
	
	super initializeParameters.
	neighbourhoodSize := 8.
	percentageOfSimilarAgentsWanted := 0.3
]

{ #category : 'as yet unclassified' }
ShellingAgent class >> neighbourhoodSize [

	^ neighbourhoodSize
]

{ #category : 'as yet unclassified' }
ShellingAgent class >> neighbourhoodSize: aNumber [

	neighbourhoodSize := aNumber
]

{ #category : 'as yet unclassified' }
ShellingAgent class >> numberOfSimilarNeighboursWanted [

	^ (self percentageOfSimilarAgentsWanted * self neighbourhoodSize) ceiling
]

{ #category : 'as yet unclassified' }
ShellingAgent class >> percentageOfSimilarAgentsWanted [

	^ percentageOfSimilarAgentsWanted
]

{ #category : 'as yet unclassified' }
ShellingAgent class >> percentageOfSimilarAgentsWanted: aNumber [

	percentageOfSimilarAgentsWanted := aNumber
]

{ #category : 'testing' }
ShellingAgent >> isHappy [

	^ self numberOfSimilarNeighbours >= self class numberOfSimilarNeighboursWanted
]

{ #category : 'as yet unclassified' }
ShellingAgent >> numberOfSimilarNeighbours [

	^ (self similarAgentsWithinRadius: 1) size
]

{ #category : 'pov' }
ShellingAgent >> pov [
	
	^ CMPointOfView size: (
		self isHappy
			ifTrue: [ 25 ]
			ifFalse: [ 10 ])
]

{ #category : 'control' }
ShellingAgent >> step [

	self isHappy ifFalse: [
		self randomJumpConstrainedBy: [ :cell | cell hasNoOccupants ] ]
]
