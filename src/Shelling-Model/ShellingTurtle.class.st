Class {
	#name : #ShellingTurtle,
	#superclass : #ShellingAgent,
	#category : #'Shelling-Model'
}

{ #category : #accessing }
ShellingTurtle class >> entityName [

	^ 'Turtle'
]

{ #category : #pov }
ShellingTurtle >> pov [

	^ Color red
]
