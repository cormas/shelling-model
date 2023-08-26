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

{ #category : #init }
ShellingModel >> init [

	self
		createGridLines: 27
		columns: 27
		neighbourhood: 8
		closed: false.
		
	
]
