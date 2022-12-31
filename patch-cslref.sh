#!/bin/bash

# fix=$(cat <<-END
# %add the CSLReference environment
# \\\\newlength{\\\\cslhangindent}
# \\\\setlength{\\\\cslhangindent}{1.5em}
# \\\\newenvironment{CSLReferences}%
#   {\\\\setlength{\\\\parindent}{0pt}%
#   \\\\everypar{\\\\setlength{\\\\hangindent}{\\\\cslhangindent}}\\\\ignorespaces}%
#   {\\\\par}
# %quotes
# END
# )

fix=$(cat <<-END
\$if(csl-refs)\$
\\\\newlength{\\\\cslhangindent}
\\\\setlength{\\\\cslhangindent}{1.5em}
\\\\newlength{\\\\csllabelwidth}
\\\\setlength{\\\\csllabelwidth}{3em}
\\\\newlength{\\\\cslentryspacingunit} % times entry-spacing
\\\\setlength{\\\\cslentryspacingunit}{\\\\parskip}
\\\\newenvironment{CSLReferences}[2] % #1 hanging-ident, #2 entry spacing
 {% don't indent paragraphs
  \\\\setlength{\\\\parindent}{0pt}
  % turn on hanging indent if param 1 is 1
  \\\\ifodd #1
  \\\\let\\\\oldpar\\\\par
  \\\\def\\\\par{\\\\hangindent=\\\\cslhangindent\\\\oldpar}
  \\\\fi
  % set entry spacing
  \\\\setlength{\\\\parskip}{#2\\\\cslentryspacingunit}
 }%
 {}
\\\\usepackage{calc}
\\\\newcommand{\\\\CSLBlock}[1]{#1\\\\hfill\\\\break}
\\\\newcommand{\\\\CSLLeftMargin}[1]{\\\\parbox[t]{\\\\csllabelwidth}{#1}}
\\\\newcommand{\\\\CSLRightInline}[1]{\\\\parbox[t]{\\\\linewidth - \\\\csllabelwidth}{#1}\\\\break}
\\\\newcommand{\\\\CSLIndent}[1]{\\\\hspace{\\\\cslhangindent}#1}
\$endif\$
%quotes
END
)

for fn in *.tex; do
    [ -f "${fn}" ] && [ "${fn}" != "eisvogel.tex" ] || continue
    # echo "${fn}"
    awk -v r="${fix}" '{gsub(/%quotes/,r)}1' "${fn}" > tmp && mv tmp "${fn}"
done
