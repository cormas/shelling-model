Class {
	#name : #ShellingModel,
	#superclass : #CMAbstractModel,
	#instVars : [
		'theCells',
		'theFrogs',
		'theTurtles'
	],
	#category : #'Shelling-Model'
}

{ #category : #accessing }
ShellingModel class >> density [

	^ 0.9
]

{ #category : #accessing }
ShellingModel class >> numberOfColumns [

	^ 27
]

{ #category : #accessing }
ShellingModel class >> numberOfRows [

	^ 27
]

{ #category : #init }
ShellingModel >> init [

	self
		createGridLines: self class numberOfRows
		columns: self class numberOfColumns
		neighbourhood: 8
		closed: false.
		
	self
		createN: (self numberOfAgents / 2) asInteger
		randomlyLocatedAloneEntities: ShellingTurtle.
		
	self
		createN: (self numberOfAgents / 2) asInteger
		randomlyLocatedAloneEntities: ShellingFrog.
		
	self
		displayPov: #pov of: ShellingCell;
		displayPov: #pov of: ShellingAgent.
]

{ #category : #initialization }
ShellingModel >> initialize [

	super initialize.
	
	theCells := OrderedCollection new.
	theTurtles := OrderedCollection new.
	theFrogs := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
ShellingModel >> numberOfAgents [

	^ (self class density * self class numberOfRows * self class numberOfColumns) asInteger
]

{ #category : #control }
ShellingModel >> step: anObject [

	"do nothing"
]

{ #category : #accessing }
ShellingModel >> theCells [

	^ theCells
]

{ #category : #accessing }
ShellingModel >> theCells: aCollection [

	theCells := aCollection
]

{ #category : #accessing }
ShellingModel >> theFrogs [

	^ theFrogs
]

{ #category : #accessing }
ShellingModel >> theFrogs: aCollection [

	theFrogs := aCollection
]

{ #category : #accessing }
ShellingModel >> theTurtles [

	^ theTurtles
]

{ #category : #accessing }
ShellingModel >> theTurtles: aCollection [

	theTurtles := aCollection
]
