Class {
	#name : 'ShellingTurtle',
	#superclass : 'ShellingAgent',
	#category : 'Shelling-Model',
	#package : 'Shelling-Model'
}

{ #category : 'aspects' }
ShellingTurtle >> aspectDefault: look [

	<aspect>
	super aspectDefault: look.
	look color: Color red
]
