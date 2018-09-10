filein ( getFilenamePath(getSourceFileName()) + "/../../../../../../includes.ms" )


clearListener()
_Button 	= Button_v()

format " _Button	= % \n" _Button

format " _Button.Prop	= % \n" _Button.Prop
format " _Button.Props	= % \n" _Button.Props

_Button.testMethod()
