if __rcCounter == undefined then global __rcCounter = 0
struct rolloutCreator
(
	-- variables
	name, caption, str, def, width, height, quote="\"",
	
	-- functions
	fn begin = 
( 
		if name == undefined then
	(
			__rcCounter += 1
			name = "rolloutCreator" + __rcCounter as string
	)
		if caption == undefined then caption = ""
		str = ""
	),
	
	fn addLocal name init: = 
(
		local dStr = "\tlocal " + name as string
		if init != unsupplied then append dStr (" = " + init as string)
		append dStr "\n"
		append str dStr
	),

	fn addControl type name caption paramStr:"" =
(	
		append str ("\t" + type as string + " " + name as string + " " + quote + caption + quote + paramStr + "\n")
	),
	
	fn strFilter codeStr =
(
			local last_is_at = codeStr[codeStr.count] == "@"
			local fltStr = filterString codeStr "@"
			local rep = "\""
			codeStr = (if (codeStr[1] == "@") then rep else "") + fltStr[1]
			for i=2 to fltStr.count do
		(
				append codeStr (rep + fltStr[i])
		)
			if last_is_at then append codeStr rep
			codeStr
	),

	fn addHandler ctrl event paramStr:"" filter:on codeStr:"" =
(
		if filter do codeStr = (strFilter codeStr)
		append str ("\non " + ctrl as string + " " + event as string + " " + paramStr as string + " do \n(\n" + codeStr + ";ok\n)\n")
	),
	
	fn addText txt filter:on =
(
		if filter do txt = (strFilter txt )
		append str ("\t " + txt + "\n")
	),
	
	fn end = 
( 
		local dStr = "rollout " + name + " " + quote + caption + quote
		if width != undefined then
 			append dStr (" width:" + width as string)
		if height != undefined then
			append dStr (" height:" + height as string)
		append dStr "\n(\n" 
		append dStr str
		append dStr "\n)\n"
		str = dStr
		def = execute str
)
)

-- Create an instance of the rolloutCreator passing the name and the caption
rfTest = rolloutCreator "rfTestN" "rfTestC" --width:300 height:100
-- Start creating the rollout
rfTest.begin()
	rfTest.addControl #button #myButton "My Button"			-- add a button
--	rfTest.addHandler #myButton #pressed filter:on codeStr:"MessageBox @Hey@"
rfTest.addHandler #myButton #pressed filter:on codeStr:"MessageBox @Look to the \@Light\@ thing@" 
rfTest.end()
createDialog rfTest.def

