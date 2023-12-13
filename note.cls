\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{note}[2023/11/28]

%% Declare options
% Language
\gdef\@document@language{english}
\DeclareOption{chinese}{\gdef\@document@language{chinese}}
% Typography
\gdef\@document@fontfamily{serif}
\DeclareOption{sans-serif}{\gdef\@document@fontfamily{sans-serif}}
% Margin
\newif\if@document@margin
\DeclareOption{margin}{\@document@margintrue}
% Typeset speed
\gdef\@document@performance{high}
\DeclareOption{fancy}{\gdef\@document@performance{low}}
% Pass on options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

%% Load custom packages
\RequirePackage{default}

\def\accentcolour{myblue}
\def\lightcolour{mybluelight}
\def\secondarycolour{mygreen}

% Title page
\def\maketitle{
	\ifdefined\@info@course
		\newcommand{\coursestring}{\@info@course}
		\readlist*\courselist{\coursestring}
	\fi
	\begin{titlepage}
		\thispagestyle{empty}
		\newgeometry{inner=2cm, outer=2cm, bottom=2cm, top=2cm, 
			marginparwidth=0cm, marginparsep=0cm, includemp}
		\centering
		\vspace*{7cm}
		\vspace*{0.3cm}
		{\Huge\sffamily\bfseries\@info@title}\\
		\vspace*{0.3cm}
		{\sffamily \ifdefined\@info@subtitle
			\@info@subtitle
		\else
			A %
			\ifdefined\@info@course lecture \fi%
			note for
			\ifdefined\@info@course
				\ifdefined\@info@institute the \@info@institute~\fi
			\ifnum \listlen\courselist[] > 1 courses\else course\fi~%
				\foreachitem\x\in\courselist[]{%
					\ifnum\xcnt = 1\else
						\ifnum\xcnt=\listlen\courselist[]~\&\else,\fi~%
					\fi%
					\textit{\x}%
				}%
			\fi%
			\ifdefined\@info@book%
				book \textit{\@info@book}%
			\fi%
			\ifdefined\@info@project%
				\ifdefined\@info@institute\@info@institute\ \fi%
				project \textit{\@info@project}%
			\fi%
			.
		\fi}
		\vfill
		\setstretch{1}
		\small
		Author: 
		\ifdefined\@info@mail
			\href{mailto:\@info@mail}{\@info@author}
		\else
			\@info@author
		\fi \\
		\ifdefined\@info@additionalinfo
			\@info@additionalinfo
		\else
			Last modified: \today
		\fi
	\end{titlepage}
}

% Label settings
\numberwithin{equation}{section}
\numberwithin{table}{section}
\numberwithin{figure}{section}


\RequirePackage{sectsty}
\setcounter{tocdepth}{2}