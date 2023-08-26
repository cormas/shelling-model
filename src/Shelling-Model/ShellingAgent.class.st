Class {
	#name : #ShellingAgent,
	#superclass : #CMAgent,
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#category : #'Shelling-Model'
}

{ #category : #'as yet unclassified' }
ShellingAgent class >> neighbourhoodSize [

	^ 8
]

{ #category : #'as yet unclassified' }
ShellingAgent class >> numberOfSimilarNeighboursWanted [

	^ (self percentageOfSimilarAgentsWanted * self neighbourhoodSize) ceiling
]

{ #category : #'as yet unclassified' }
ShellingAgent class >> percentageOfSimilarAgentsWanted [

	^ 0.3
]

{ #category : #testing }
ShellingAgent >> isHappy [

	^ self numberOfSimilarNeighbours >= self class numberOfSimilarNeighboursWanted
]

{ #category : #'as yet unclassified' }
ShellingAgent >> numberOfSimilarNeighbours [

	^ (self similarAgentsWithinRadius: 1) size
]

{ #category : #pov }
ShellingAgent >> pov [

	self subclassResponsibility
]

{ #category : #accessing }
ShellingAgent >> sizeOfPOV [

	^ self isHappy
		ifTrue: [ 25 ]
		ifFalse: [ 10 ]
]

{ #category : #control }
ShellingAgent >> step [

	self isHappy ifFalse: [
		self randomJumpConstrainedBy: [ :cell | cell hasNoOccupants ] ]
]
