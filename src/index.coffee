mongoose = require("mongoose")

exports.timestamps = (schema, options) ->
  options = {} unless options

  schema.add
    createdAt: Date
    updatedAt: Date

  schema.pre "save", (next) ->
    unless @createdAt
      @createdAt = @updatedAt = new Date
    else
      @updatedAt = new Date
    next()