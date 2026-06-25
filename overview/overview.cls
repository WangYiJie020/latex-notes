\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{overview}[2026/06/25 Shared class for overview notes]

\newif\ifoverview@aiv
\DeclareOption{a4}{\overview@aivtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass{article}

\ifoverview@aiv
  \RequirePackage[a4paper, margin={.5in,1in}]{geometry}
\else
  \RequirePackage[paperwidth=190mm,paperheight=330mm, margin={.5in,.6in}]{geometry}
\fi

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{mathdots}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\usetikzlibrary{arrows,matrix,positioning}
\usetikzlibrary{decorations.markings}
\usetikzlibrary{arrows.meta}
\usetikzlibrary{fit}
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.18}
\RequirePackage{extarrows}
\RequirePackage{cancel}

\theoremstyle{definition}
\newtheorem*{example}{Example}
\newtheorem*{answer}{Answer}

\theoremstyle{definition}
\newtheorem{theorem}{Theorem}[section]
\newtheorem{lemma}[theorem]{Lemma}

\theoremstyle{remark}
\newtheorem*{remark}{Remark}

\author{Pi Han}

\newcommand{\ltoinf}{\lim_{x \to \infty}}
\newcommand{\jlm}[4]{\lim_{(#1, #2)\to(#3, #4)}}
\newcommand{\lmxy}[2]{\jlm{x}{y}{#1}{#2}}
\newcommand{\lmxyoo}{\lmxy{0}{0}}

\newcommand{\sh}{\sinh}
\newcommand{\ch}{\cosh}
\newcommand{\ash}{\operatorname{arcsinh}}
\newcommand{\ach}{\operatorname{arccosh}}
\newcommand{\ath}{\operatorname{arctanh}}
\newcommand{\arccot}{\operatorname{arccot}}
\newcommand{\arccoth}{\operatorname{arccoth}}
\newcommand{\dd}{\mathrm{d}}
\newcommand{\compose}{\circ}

\newcommand{\tr}{\operatorname{tr}}
\newcommand{\rank}{\operatorname{rank}}
\newcommand{\diag}{\operatorname{diag}}
\newcommand{\A}{\boldsymbol{A}}
\newcommand{\B}{\boldsymbol{B}}
\newcommand{\I}{\boldsymbol{I}}
