local tslint = {
  sourceName = "tslint",
  command = "tslint",
  args = { "%filepath", "-t", "json" },
  parseJson = {
    line = "startPosition.line",
    column = "startPosition.character",
    endLine = "endPosition.line",
    endColumn = "endPosition.character",
    message = "[tslint] ${failure} (${ruleName})",
    security = "ruleSeverity",
  }
}

return tslint
