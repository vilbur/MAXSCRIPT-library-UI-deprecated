__author__ = "Ace_Zhang"
__email__ = "394452216@qq.com"
__doc__ = "Simple create json with MaxScript"
__version__ = "0.0.1"

struct MXSJson
(
	__keys__ = #(),
	__value__ = #(),
		
	fn format_type value =(
		local f_value = stringstream ""
		
		class_type = classof value

		if superclassof value == StructDef do(
			format "%" ("{" +value.__json__()+"}") to:f_value
			return f_value as string
			)

		if class_type == String do(
			format "\"%\"" value to:f_value
			return f_value as string
		)
		
		if class_type == Integer do(
			format "%" value to:f_value
			return f_value as string
		)

		if class_type == Array do(
			format "["  to:f_value
			for a in value do(
				l_value = this.format_type a
				
				format_s = "%,"
				if a == value[value.count] do(
					format_s = "%"
					)
				format format_s l_value to:f_value
				)

			format "]" to:f_value	
		)

		return f_value as string
	),
	
	fn __json__ = (
		data = ""
		
		for a in __keys__ do(

			data += "\""+ a + "\":"
			item = __value__[finditem __keys__ a]
			if superclassof item == StructDef then(
				data += "{"+item.__json__()+"}"
				
				)else(

					end_s = ","
					if finditem __keys__ a >= __keys__.count do(
						
						end_s = ""
					)
					
					data += this.format_type(item)+end_s
					)
		)
		return data
	),
	
	fn json = (
		return "{"+ this.__json__()+"}"
	),
		
	fn items = (
		return this.__keys__
	),

	fn item key =(
		index = finditem this.__keys__ key 
		if index != 0 do(
			return this.__value__[index]
		)
	),

	fn add key value= (
		index = finditem this.__keys__ key
		if index == 0 do(
			append this.__keys__ key
			index = finditem this.__keys__ key
		)
		this.__value__[index] = value
		
	)
)



a = MXSJson()
a.add "zip_filename" "xx.rar"
a.add "thumb_filename" "xx.jpg"
a.add "api" "api_xx"
a.add "mode" "model"

deep = MXSJson()
deep.add "deep_key" "ley"

a.add "list" #(1,2,deep)

deep = MXSJson()
deep.add "deep2" "deep"

a.add "deep" deep

deep3 = MXSJson()

deep.add "deep33" deep3

a.json()

/*
Json Output:

{
    "zip_filename": "d:\test.123.jpg",
    "thumb_filename": "d:\test.123.jpg",
    "api": "api_xx",
    "mode": "model",
    "list": [
			1,
			2,
			{
				"deep_key": "ley"
			}
		   ],
    "deep": {
        "deep2": "deep",
        "deep33": {}
    }
}
*/