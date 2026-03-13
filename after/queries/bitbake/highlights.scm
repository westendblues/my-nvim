; Enhanced BitBake syntax highlighting

; BitBake-specific variables (often all caps)
((identifier) @constant
  (#lua-match? @constant "^[A-Z][A-Z_0-9]*$"))

; Package names and version patterns
((identifier) @variable.parameter
  (#lua-match? @variable.parameter "^PN$"))

((identifier) @variable.parameter
  (#lua-match? @variable.parameter "^PV$"))

((identifier) @variable.parameter
  (#lua-match? @variable.parameter "^PR$"))

; Common BitBake variables with semantic meaning
([
  (identifier)
] @variable.builtin
  (#any-of? @variable.builtin
    "DEPENDS" "RDEPENDS" "PROVIDES" "RPROVIDES"
    "SRC_URI" "SRCREV" "WORKDIR" "D" "S" "B"
    "PACKAGES" "FILES" "SUMMARY" "DESCRIPTION"
    "LICENSE" "LIC_FILES_CHKSUM"
    "HOMEPAGE" "SECTION" "PRIORITY"
    "AUTHOR" "MAINTAINER"
    "PACKAGECONFIG" "EXTRA_OECONF" "EXTRA_OECMAKE"
    "COMPATIBLE_MACHINE" "COMPATIBLE_HOST"
    "INHERIT" "BBCLASSEXTEND"
    "INSANE_SKIP" "ERROR_QA" "WARN_QA"))

; Task names in do_* functions
((identifier) @function.builtin
  (#lua-match? @function.builtin "^do_[a-z_]+$"))

; Variable flags (_append, _prepend, etc.)
((identifier) @keyword.modifier
  (#lua-match? @identifier ".*_append$"))

((identifier) @keyword.modifier
  (#lua-match? @identifier ".*_prepend$"))

((identifier) @keyword.modifier
  (#lua-match? @identifier ".*_remove$"))

; Override syntax (e.g., VAR:append, VAR:remove)
(override) @keyword.modifier

; Machine and distro overrides
((identifier) @type
  (#lua-match? @type ".*:qemux86.*"))

; Inline Python and shell expansions - make them stand out
(inline_python) @function.macro

(variable_expansion) @variable.member

; Include paths should be more visible
(include_path) @string.special.path

; Comments should support spell checking
(comment) @comment @spell

; Flag assignments like SRC_URI[md5sum]
(flag) @property

; Make inherit statements more visible
(inherit_directive
  "inherit" @keyword.import
  (inherit_path) @module)

; Recipe names in require/include
(require_directive
  "require" @keyword.import
  (include_path) @string.special.path)

(include_directive
  "include" @keyword.import
  (include_path) @string.special.path)
