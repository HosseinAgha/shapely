module.exports = class Field
	(@id, @def, @defaultValue, @unionCls) ->
		@__id = @id

		if @defaultValue?
			@validate @defaultValue

	create: (val) ->
		v = val ? @defaultValue
		@validate v
		v

	_getValidationError: -> true

	isValid: ->
		typeof @_getValidationError(...arguments) isnt \string

	validate: (val) ->
		err = @_getValidationError val

		if typeof err is 'string'
			throw Error "Error validating `#{@__id}`: #{err}"

	deserialize: (v) ->
		v

	serialize: (v) ->
		v