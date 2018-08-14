Shell = require 'shell'

module.exports =
  activate: ->
    atom.commands.add 'atom-workspace', 'naversearch:naver-it': => @search()

  search: ->
    editor = atom.workspace.getActiveTextEditor()
    buffer = editor.getBuffer()
    selections = editor.getSelections()

    buffer.transact ->
      for selection in selections
        cased = selection.getText()
        url = "https://search.naver.com/search.naver?query=#{cased}"
        Shell.openExternal url
