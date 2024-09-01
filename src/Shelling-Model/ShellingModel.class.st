Class {
	#name : 'ShellingModel',
	#superclass : 'CMAbstractModel',
	#instVars : [
		'theCells',
		'theFrogs',
		'theTurtles'
	],
	#classInstVars : [
		'density',
		'numberOfRows',
		'numberOfColumns'
	],
	#category : 'Shelling-Model',
	#package : 'Shelling-Model'
}

{ #category : 'accessing' }
ShellingModel class >> density [

	^ density
]

{ #category : 'accessing' }
ShellingModel class >> density: aNumber [

	density := aNumber
]

{ #category : 'initialization' }
ShellingModel class >> initializeParameters [

	super initializeParameters.
	density := 0.95.
	numberOfRows := 27.
	numberOfColumns := 27
]

{ #category : 'accessing' }
ShellingModel class >> numberOfColumns [

	^ numberOfColumns
]

{ #category : 'accessing' }
ShellingModel class >> numberOfColumns: aNumber [

	numberOfColumns := aNumber
]

{ #category : 'accessing' }
ShellingModel class >> numberOfRows [

	^ numberOfRows
]

{ #category : 'accessing' }
ShellingModel class >> numberOfRows: aNumber [

	numberOfRows := aNumber
]

{ #category : 'init' }
ShellingModel >> init [

	<init>
	self
		createGridNumberOfRows: self class numberOfRows
		numberOfColumns: self class numberOfColumns
		neighbourhood: 8
		closed: false.
		
	self
		createN: (self numberOfAgents / 2) asInteger
		randomlyLocatedAloneEntities: ShellingTurtle.
		
	self
		createN: (self numberOfAgents / 2) asInteger
		randomlyLocatedAloneEntities: ShellingFrog
]

{ #category : 'initialization' }
ShellingModel >> initialize [

	super initialize.
	
	theCells := OrderedCollection new.
	theTurtles := OrderedCollection new.
	theFrogs := OrderedCollection new.
]

{ #category : 'as yet unclassified' }
ShellingModel >> numberOfAgents [

	^ (self class density * self class numberOfRows * self class numberOfColumns) asInteger
]

{ #category : 'probes' }
ShellingModel >> numberOfHappyAgents [

	<probeNamed: 'Number of happy agents' color: 'C2C200'>
	^ self numberOfHappyTurtles + self numberOfHappyFrogs 
]

{ #category : 'probes' }
ShellingModel >> numberOfHappyFrogs [

	<probeNamed: 'Number of happy frogs' color: '00b44c'>
	^ theFrogs count: [ :each | each isHappy ]
]

{ #category : 'probes' }
ShellingModel >> numberOfHappyTurtles [

	<probeNamed: 'Number of happy turtles' color: 'FF0000'>
	^ theTurtles count: [ :each | each isHappy ]
]

{ #category : 'control' }
ShellingModel >> step [

	<control>
	self askRandom: ShellingAgent toDo: #step
]

{ #category : 'accessing' }
ShellingModel >> theCells [

	<getterFor: #ShellingCell>
	^ theCells
]

{ #category : 'accessing' }
ShellingModel >> theFrogs [

	<getterFor: #ShellingFrog>
	^ theFrogs
]

{ #category : 'accessing' }
ShellingModel >> theTurtles [

	<getterFor: #ShellingTurtle>
	^ theTurtles
]
