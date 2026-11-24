Class {
	#name : 'ShellingModel',
	#superclass : 'CMAbstractModel',
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
ShellingModel class >> modelName [
	
	^ 'Shelling'
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

{ #category : 'tests - printing' }
ShellingModel class >> prefix [

	^ 'Shelling'
]

{ #category : 'charts' }
ShellingModel >> chartHappiness [
	"How many agents are happy with their neighbours, turtles and frogs alike?"

	<chart>
	^ CMChart new
		  title: 'Happy agents';
		  yTitle: 'Number of agents';
		  add: (CMLineSeries new x: #currentTimeStep y: #numberOfHappyAgents;
				   label: 'Happy agents';
				   color: (Color fromHexString: 'C2C200');
				   yourself);
		  add: (CMLineSeries new x: #currentTimeStep y: #numberOfHappyTurtles;
				   label: 'Happy turtles';
				   color: Color red;
				   yourself);
		  add: (CMLineSeries new x: #currentTimeStep y: #numberOfHappyFrogs;
				   label: 'Happy frogs';
				   color: (Color fromHexString: '00B44C');
				   yourself);
		  yourself
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
		create: (self numberOfAgents / 2) asInteger
		randomlyLocatedAloneEntitiesOfClass: ShellingTurtle.
		
	self
		create: (self numberOfAgents / 2) asInteger
		randomlyLocatedAloneEntitiesOfClass: ShellingFrog
]

{ #category : 'as yet unclassified' }
ShellingModel >> numberOfAgents [

	^ (self class density * self class numberOfRows * self class numberOfColumns) asInteger
]

{ #category : 'probes' }
ShellingModel >> numberOfHappyAgents [

	<probe>
	^ self numberOfHappyTurtles + self numberOfHappyFrogs 
]

{ #category : 'probes' }
ShellingModel >> numberOfHappyFrogs [

	<probe>
	^ (self @@ ShellingFrog) count: [ :each | each isHappy ]
]

{ #category : 'probes' }
ShellingModel >> numberOfHappyTurtles [

	<probe>
	^ (self @@ ShellingTurtle) count: [ :each | each isHappy ]
]

{ #category : 'control' }
ShellingModel >> step [

	<control>
	(self shuffled: self agents) do: #step
]
