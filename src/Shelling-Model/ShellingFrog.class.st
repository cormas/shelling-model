Class {
	#name : 'ShellingFrog',
	#superclass : 'ShellingAgent',
	#category : 'Shelling-Model',
	#package : 'Shelling-Model'
}

{ #category : 'pov' }
ShellingFrog >> pov [

	<pov>
	^ super pov
		color: (Color fromHexString: '00b44c');
		yourself
]
