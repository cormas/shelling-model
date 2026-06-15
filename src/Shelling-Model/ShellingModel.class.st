Class {
	#name : 'ShellingModel',
	#superclass : 'CMModel',
	#instVars : [
		'numberOfRows',
		'numberOfColumns',
		'density'
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
ShellingModel class >> modelName [
	
	^ 'Shelling'
]

{ #category : 'tests - printing' }
ShellingModel class >> prefix [

	^ 'Shelling'
]

{ #category : 'parameters' }
ShellingModel >> density [
	<parameterFloatMin: 0 max: 1 default: 0.95>
	^ density
]

{ #category : 'parameters' }
ShellingModel >> density: anObject [

	density := anObject
]

{ #category : 'init' }
ShellingModel >> init [

	<init>
	self
		createGridNumberOfRows: numberOfRows
		numberOfColumns: numberOfColumns
		neighbourhood: 8
		closed: false.
		
	self
		create: (self numberOfAgents / 2) asInteger
		randomlyLocatedAloneEntitiesOfClass: ShellingTurtle.
		
	self
		create: (self numberOfAgents / 2) asInteger
		randomlyLocatedAloneEntitiesOfClass: ShellingFrog
]

{ #category : 'as yet unclassified' }
ShellingModel >> numberOfAgents [

	^ (density * numberOfRows * numberOfColumns) asInteger
]

{ #category : 'parameters' }
ShellingModel >> numberOfColumns [
	<parameterIntegerMin: 1 max: 300 default: 27>
	^ numberOfColumns
]

{ #category : 'parameters' }
ShellingModel >> numberOfColumns: anObject [

	numberOfColumns := anObject
]

{ #category : 'probes' }
ShellingModel >> numberOfHappyAgents [

	<probeNamed: 'Number of happy agents' color: 'C2C200'>
	^ self numberOfHappyTurtles + self numberOfHappyFrogs 
]

{ #category : 'probes' }
ShellingModel >> numberOfHappyFrogs [

	<probeNamed: 'Number of happy frogs' color: '00b44c'>
	^ (self @@ ShellingFrog) count: [ :each | each isHappy ]
]

{ #category : 'probes' }
ShellingModel >> numberOfHappyTurtles [

	<probeNamed: 'Number of happy turtles' color: 'FF0000'>
	^ (self @@ ShellingTurtle) count: [ :each | each isHappy ]
]

{ #category : 'parameters' }
ShellingModel >> numberOfRows [
	<parameterIntegerMin: 1 max: 300 default: 27>
	^ numberOfRows
]

{ #category : 'parameters' }
ShellingModel >> numberOfRows: anObject [

	numberOfRows := anObject
]

{ #category : 'control' }
ShellingModel >> step [

	<control>
	(self shuffled: self agents) do: #step
]
