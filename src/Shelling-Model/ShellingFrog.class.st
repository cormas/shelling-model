Class {
	#name : 'ShellingFrog',
	#superclass : 'ShellingAgent',
	#category : 'Shelling-Model',
	#package : 'Shelling-Model'
}

{ #category : 'aspects' }
ShellingFrog >> aspectDefault: look [

	<aspect>
	super aspectDefault: look.
	look color: (Color fromHexString: '00b44c')
]
