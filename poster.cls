\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{note}[2023/05/30 initial commit]


%% Class Options
% Language
\gdef\@posterLanguage{english}
\DeclareOption{chinese}{\gdef\@posterLanguage{chinese}}
% Typography
% \gdef\@document@fontfamily{sans-serif}
% \DeclareOption{serif}{\gdef\@document@fontfamily{serif}}
% \DeclareOption{sans-serif}{\gdef\@document@fontfamily{sans-serif}}
% \DeclareOption{font}{\gdef\@document@fontfamily{external}}
\newif\if@document@sansserif
\@document@sansseriftrue
\DeclareOption{serif}{\@document@sansseriffalse}
\DeclareOption{sans-serif}{\@document@sansseriftrue}
% Pass on options
\ProcessOptions\relax
\LoadClass{article}


%% Poster information
\RequirePackage{documentinformation}
\newcommand{\inst}[1]{\textsuperscript{#1}}


%% Load essential packages
% Maths
\RequirePackage{amsmath, amsthm, amsfonts, amssymb, cancel, mathtools}
% Logic and list processing
\RequirePackage{xstring, etoolbox, listofitems}
% Figures and plotting
\RequirePackage{graphicx, pdfpages, wrapfig, mdframed, 
	tikz, pgfplots, tikz-3dplot, tikz-qtree, circuitikz}
\RequirePackage[labelfont={sf,bf}]{caption, subcaption}
% Tables
\RequirePackage{multicol, multirow, array, tabularx, longtable, makecell, arydshln, algorithm, algpseudocode}
% Lists
\RequirePackage[inline]{enumitem}
% Colours
\RequirePackage{color, xcolor}
% Titles
\RequirePackage{titlesec}


%% Load custom packages

%% Page geometry
\RequirePackage{geometry, setspace, titlesec}
\newlength{\@document@fontsize}
\setlength{\@document@fontsize}{\f@size pt}
\setlength{\parindent}{2\@document@fontsize}
\geometry{
	left=2\parindent, right=2\parindent, 
	bottom=2\parindent, top=2\parindent, 
	marginparwidth=0cm, marginparsep=0cm, includemp}
\setlength{\columnsep}{\parindent}
\setstretch{1.1}
\pagestyle{empty}


%% Typography
\ifdefstring{\@document@fontfamily}{serif}{
}{
}
\ifdefstring{\@document@fontfamily}{sans-serif}{
	\renewcommand{\familydefault}{\sfdefault}
}{
}
\ifdefstring{\@document@fontfamily}{font}{
	\renewcommand{\familydefault}{\sfdefault}
	\RequirePackage{fontspec}
	\RequirePackage{FiraSans}
	\RequirePackage[mathrm=sym]{unicode-math}
	\setmathfont{Fira Math}
	\setmonofont{Fira Code}
}{
}

%% Titles
% Title
\def\maketitle{\begin{center}
	\ifdefined\@info@title
		{\bfseries\huge\color{primarycolour}\@info@title} \\
	\fi
	\ifdefined\@info@author
		\@info@author \\
	\fi
	\ifdefined\@info@institute
		\@info@institute \\
	\fi
\end{center}
}
% Section
\let\oldsection\section
\renewcommand{\section}[1]{
\begin{mdframed}
	[
	backgroundcolor=primarycolour, linewidth=0pt,
	skipabove=0.5\baselineskip, skipbelow=0pt,
	leftmargin=0pt, rightmargin=0pt,
	innerleftmargin=\@document@fontsize, innerrightmargin=0pt,
	innertopmargin=0.5\@document@fontsize, innerbottommargin=0.5\@document@fontsize
	]
	{\hfill\large\bfseries\color{secondarycolour}#1\hfill}
\end{mdframed}
}
% Paragraph
\titlespacing{\paragraph}{0pt}{0.25\baselineskip}{0.5\parindent}


%% Colours
\colorlet{accentcolour}{blue}
\colorlet{primarycolour}{teal}
\colorlet{secondarycolour}{brown!25!yellow}


%% Language
% Chinese
\ifdefstring{\@posterLanguage}{chinese}{
	% Typography
	\renewcommand{\familydefault}{\sfdefault}
	\RequirePackage{xeCJK}
	\setCJKsansfont{Source Han Sans TC}
	% Float texts
	\renewcommand{\figurename}{圖}
	\renewcommand{\tablename}{表}
	\renewcommand{\bibname}{參考資料}
	\renewcommand{\refname}{參考資料}
	\renewcommand{\contentsname}{目錄}
	% Titles
	\titlespacing{\paragraph}{0pt}{0.25\baselineskip}{0.15\parindent}
}{
}