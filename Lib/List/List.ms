
/** Object or assoc array fake
 *	https://github.com/davestewart/maxscript/blob/master/3D/3ds2ae/03_3ds/dev/compound%20structures/associative%20array.ms
 */
struct List_v
(
	keys	= #(),
	values	= #(),
	
	fn setVal str val=
	(
		
		local i=findItem keys (str as string)
		--format ">> %\n" i
		if i>0 then
		(
			keys[i]	= str
			values[i]	= val
		)
		else
		(
			append keys str
			append values val
		)
	),

	fn getVal str=
	(
		local i=findItem keys str
		if i>0 then return values[i]
	),
	
	fn delete str=
	(
		local i=findItem keys str
		if i>0 then
		(
			deleteItem keys	i
			deleteItem values	i
			
		)
	)
)
