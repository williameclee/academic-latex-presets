\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2023/12/12]
\RequirePackage{cvtheme}

%% Class options
\input{option.def}
\ExecuteOptions{sans-serif}
\ExecuteOptions{10pt}
% Pass on options
\ProcessOptions\relax
\LoadClassWithOptions{article}

%% Personal information options
\RequirePackage{etoolbox}
\input{documentinformation.def}
\let\title\author

\ifdefstring{\@document@language}{chinese}{
	\input{languagee-chinese.def}
}{}

%% Geometry
\input{layout.def}
\RequirePackage{geometry, setspace, titlesec}
\setstretch{1.3}
\renewcommand{\arraystretch}{1.6}

\usepackage{floatrow, placeins}

\input{typography.def}

%% Link settings
\RequirePackage[hidelinks]{hyperref}

%% Colour settings
\RequirePackage{color, xcolor}
\input{color.def}
\def\accentcolor{sandgreen}

%% Figure settings
\RequirePackage{graphicx, pdfpages, tikz, pgfplots}


%% Footnote settings
\RequirePackage{footnote}
\makesavenoteenv{tabular}
\makesavenoteenv{table}
\renewcommand*{\thefootnote}{\fnsymbol{footnote}}

%% List settings
\RequirePackage[inline]{enumitem}
\setlist{leftmargin=\parindent}
\newlist{tablelist}{itemize}{10}
\setlist[tablelist]{
	nosep,
	topsep=-\baselineskip, 
	leftmargin=\gap, 
	label={\color{\accentcolor}\tikz{\fill circle(2pt)}},
}
% \AtBeginEnvironment{tablelist}{\vspace*{-\baselineskip}}
\AfterEndEnvironment{tablelist}{$\displaystyle$}

%% Header & footer settings
\input{headerfooter.def}
\pagestyle{cv@plain}

%% Math settings
\RequirePackage{amsmath, amsthm, amsfonts, mathtools}


\RequirePackage{calc}
\newlength{\lmarginwidth}
\newlength{\rmarginwidth}
\newlength{\gap}
\setlength{\lmarginwidth}{0.2\linewidth}
\setlength{\rmarginwidth}{0.3\linewidth}
\setlength{\gap}{1.5em}

% Title formats
\titleformat{\section}{\color{\accentcolor}\bfseries\Large\MakeUppercase}{}{\baselineskip}{}
\titlespacing*{\section}{0pt}{\baselineskip}{-0.25\baselineskip}

\titleformat{\subsection}{\bfseries\large}{}{\baselineskip}{}
\titlespacing*{\subsection}{0pt}{0.5\baselineskip}{-0.25\baselineskip}


%% Custom commands
\newcommand{\alert}[1]{{\color{\accentcolor}#1}}
\ifdefined\docOptionChinese
	\newcommand{\certif}[2]{#1 — \newline #2}
\else
	\newcommand{\certif}[2]{#1 — \newline #2}
\fi
\newcommand{\sectionline}{\noindent\makebox[\linewidth]{{\color{\accentcolor}\rule{\linewidth}{1pt}}}}
% \newcommand*\arrowhref[2]{\href{#1}{#2\textsuperscript{\tikz[baseline=(char.base)]{
% 	\node[shape=circle,fill=\accentcolor,inner sep=0.5pt] (char) {\textcolor{white}{\scshape\bfseries\tiny ↗}};}}}
% }

% Insert title
\input{maketitle.def}
\let\maketitle\maketitle@cv

%% Table items
% Sections
% \usepackage{longtable}
% \newenvironment{cvsection}[1][]{%
% 	\section*{#1}%
% 	\begin{tabular}{@{}T{}@{}C{}I{}@{}}%
% }{
% 	\end{tabular}
% }
% \newenvironment{cvsection*}[1][]{%
% 	\begin{tabular}{@{}T{}@{}C{}I{}@{}}%
% }{
% 	\end{tabular}
% }
% Timeline
% \def\xlocation{-0.4}
% \newcommand{\timeline}[2]{
% 	\begin{tikzpicture}[x={\gap}, y={\baselineskip}, baseline={(base.base)}]
% 		\draw[white] (0,0) -- (0.7,0);
% 		\node[text width=4pt, inner sep=0pt, outer sep=0pt, fill=\accentcolor, circle] () at (0,0) {};
% 		\node[text width=4pt, inner sep=0pt, outer sep=0pt, fill=\accentcolor, circle] () at (0,-1) {};
% 		\node[align=right, anchor=mid east, yshift=-1pt, inner sep=0pt, outer sep=0pt] (base) at (\xlocation,0) {\uppercase{#2}};
% 		\node[align=right, anchor=mid east, yshift=-1pt, inner sep=0pt, outer sep=0pt] () at (\xlocation,-1) {\uppercase{#1}};
% 		\draw[\accentcolor, thick] (0,0) -- (0,-1);
% 	\end{tikzpicture}
% }
% \newcommand{\timepoint}[1]{
% 	\begin{tikzpicture}[x={\gap}, y={\baselineskip}, baseline={(base.base)}]
% 		\draw[white] (0,0) -- (0.7,0);
% 		\node[text width=4pt, inner sep=0pt, outer sep=0pt, fill=\accentcolor, circle] (base) at (0,0) {};
% 		\node[align=right, anchor=mid east, yshift=-1pt, inner sep=0pt, outer sep=0pt] (base) at (\xlocation,0) {\uppercase{#1}};
% 	\end{tikzpicture}
% }

% Events
\RequirePackage{listofitems}
% \newcommand{\event}[5]{\noindent%
% 	\begin{tabular}{@{}T{}@{}C{}I{}@{}}
% 		\let\timestring\undefined%
% 		\newcommand{\timestring}{#1}%
% 		\readlist*\timelist{\timestring}%
% 		\ifnum\listlen\timelist[]=1 %
% 			\timepoint{\MakeUppercase{\timelist[1]}}%
% 		\else %
% 			\timeline{\MakeUppercase{\timelist[1]}}{\MakeUppercase{\timelist[2]}}%
% 		\fi% date
% 		& \textbf{#2}% position
% 		\ifx\relax#3\relax\else , #3 \fi% event
% 		\ifx\relax#4\relax\else \newline #4 \fi% description
% 		& #5 % host
% 	\end{tabular}
% 	\newline
% }

\RequirePackage{multicol, multirow, array, tabularx, longtable}
\setlength{\arrayrulewidth}{1pt}
\renewcommand{\tabcolsep}{0.5\gap}
\newcolumntype{P}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}p{#1}}
\newcolumntype{T}[1]{R{\lmarginwidth}}
\newcolumntype{C}[1]{P{\linewidth - \lmarginwidth - \rmarginwidth - 2\gap}}
\newcolumntype{I}[1]{P{\rmarginwidth}}
\newcolumntype{A}[1]{P{\linewidth - \lmarginwidth - \gap}}
\BeforeBeginEnvironment{tabular}{\vspace{-0.6\baselineskip}}
\AfterEndEnvironment{tabular}{\vspace{0.2\baselineskip}}

\newcommand{\event}[5]{%
	\noindent%
	\begin{tabular}{@{}T{}A{}@{}}
		\let\timestring\undefined%
		\newcommand{\timestring}{#1}%
		\readlist*\timelist{\timestring}%
		\ifnum\listlen\timelist[]=1 %
			\timelist[1]%
		\else
			\timelist[1] - \timelist[2]%
		\fi% date
		& \textbf{#2}% position
		\ifx\relax#3\relax\else, #3 \fi% event
		\\[-1.4em]
		& { #5} % institute
		\ifx\relax#4\relax\else \\[-1em] & \expandafter#4 \fi% description
	\end{tabular}
	\newline
}

% Personal configurations
\input{personal.def}