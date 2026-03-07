-- NOTE: command: PlantumlOpen this can have trouble with bigger and more complicated .puml files
return {
  "weirongxu/plantuml-previewer.vim",
  dependencies = { "tyru/open-browser.vim", "aklt/plantuml-syntax" },
  lazy = true,
  ft = "plantuml",
  cmd = "PlantumlOpen",
}
