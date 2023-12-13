\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2023/12/12]
\RequirePackage{cvtheme}

%% Class options
\RequirePackage{etoolbox}
% Language
\gdef\@document@language{english}
\DeclareOption{chinese}{\gdef\@document@language{chinese}}
% Font
\gdef\@document@fontfamily{default}
\DeclareOption{serif}{\gdef\@document@fontfamily{serif}}
\DeclareOption{sans-serif}{\gdef\@document@fontfamily{sans-serif}}
% Typeset speed
\gdef\@document@performance{high}
\DeclareOption{fancy}{\gdef\@document@performance{low}}
% Pass on options
\ProcessOptions\relax
\LoadClass{article}

%% Personal information options
\input{cvinfo.def}

%% Geometry
\RequirePackage{geometry, setspace, titlesec}
\setstretch{1.3}
\renewcommand{\arraystretch}{1.6}
\newlength{\textsize}
\setlength{\textsize}{\f@size pt}
\setlength{\parindent}{2\textsize}
\geometry{left=2.5cm, right=2.5cm, bottom=2cm, top=2cm, 
	marginparwidth=0cm, marginparsep=0cm, includemp}
\usepackage{floatrow, placeins}

%% Typography
\IfSubStr{\@document@performance}{low}{
	\IfSubStr{\@document@fontfamily}{serif}{
		% docOptionFont: serif
		\usepackage{fontspec}
		\ifdefstring{\@document@language}{chinese}{
			\setmainfont[SmallCapsFont = SF Pro Text-Bold]{Palatino}
			\setCJKmainfont{Source Han Serif TC}
		}{
			\setmainfont[SmallCapsFont = SF Pro Text-Bold]{Palatino}
		}
	}{}
	\IfSubStr{\@document@fontfamily}{sans-serif}{
		% docOption: sans-serif
		\usepackage{fontspec}
		\renewcommand{\familydefault}{\sfdefault}
		\ifdefstring{\@document@language}{chinese}{
			\setsansfont[SmallCapsFont = SF Pro Text-Bold]{SF Pro Text}
			\setCJKsansfont{Source Han Sans TC}
		}{
%			\setsansfont[SmallCapsFont = SF Pro Text-Bold]{Rubik}
			\setsansfont[SmallCapsFont = SF Pro Text-Bold]{Fira Sans}
%			\setsansfont[SmallCapsFont = SF Pro Text-Bold]{Raleway-Medium}
		}
	}{}
}
{
	\IfSubStr{\@document@fontfamily}{serif}{
		\usepackage{kpfonts}
		\usepackage{helvet}
	}{}
	\IfSubStr{\@document@fontfamily}{sans-serif}{
		\renewcommand{\familydefault}{\sfdefault}
		\usepackage{kpfonts}
		\usepackage{helvet}
	}{}
}

%% Link settings
\RequirePackage[hidelinks]{hyperref}

%% Colour settings
\RequirePackage{color, xcolor}
	\definecolor{myblue}	  {RGB}{070, 133, 196}
	\definecolor{mybluelight} {RGB}{225, 250, 250}
	\definecolor{mygreen}	  {RGB}{082, 156, 082}
	\definecolor{mygreenlight}{RGB}{245, 250, 195}
	\definecolor{mygreydark}  {RGB}{100, 110, 120}
	\definecolor{mygreylight} {RGB}{209, 222, 218}
	\definecolor{mysandgreen} {RGB}{049, 140, 133}
\def\accentcolour{mysandgreen}

%% Table settings
\RequirePackage{multicol, multirow, array, tabularx, longtable}
\setlength{\arrayrulewidth}{1pt}
\renewcommand{\tabcolsep}{0.5\gap}
\newcolumntype{P}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}p{#1}}
\newcolumntype{T}[1]{R{\lmarginwidth + 1.2\gap}}
\newcolumntype{C}[1]{P{\linewidth - \lmarginwidth - \rmarginwidth - 2.2\gap}}
\newcolumntype{I}[1]{P{\rmarginwidth}}
\BeforeBeginEnvironment{tabular}{\vspace{-0.6\baselineskip}}

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
\setlist[tablelist]{itemsep=0pt, topsep=0pt, partopsep=0pt, 
	leftmargin=\gap, 
	label={\color{\accentcolour}\tikz{\fill circle(2pt)}}
}
\AtBeginEnvironment{tablelist}{\vspace*{-\baselineskip}}

%% Header & footer settings
\RequirePackage{fancyhdr, lastpage}
\fancypagestyle{empty}{%
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
	\fancyhf{}
	\fancyfoot[C]{
		\alert{\footnotesize \thepage\ of \pageref{LastPage}}
	}
}
\fancypagestyle{plain}{%
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
	\fancyhf{}
	\fancyhead[L]{
		\ifdefined\@info@mail
			\alert{\href{mailto:\@info@mail}{\footnotesize\@info@title}}
		\else
			\alert{\footnotesize\@info@title}
		\fi
	}
	\fancyfoot[C]{
		\alert{\footnotesize \thepage\ of \pageref{LastPage}}
	}
}
\pagestyle{plain}

%% Math settings
\RequirePackage{amsmath, amsthm, amsfonts, amssymb, mathtools}
%\RequirePackage{wasysym}


\RequirePackage{calc}
\newlength{\lmarginwidth}
\newlength{\rmarginwidth}
\newlength{\gap}
\setlength{\lmarginwidth}{0.2\linewidth}
\setlength{\rmarginwidth}{0.3\linewidth}
\setlength{\gap}{1.5em}

% Title formats
\titleformat{\section}{\color{\accentcolour}\bfseries\Large\MakeUppercase}{}{\baselineskip}{}
\titlespacing*{\section}{0pt}{\baselineskip}{-0.25\baselineskip}

\titleformat{\subsection}{\bfseries\large}{}{\baselineskip}{}
\titlespacing*{\subsection}{0pt}{0.5\baselineskip}{-0.25\baselineskip}


%% Custom commands
\newcommand{\alert}[1]{{\color{\accentcolour}#1}}
\ifdefined\docOptionChinese
	\newcommand{\certif}[2]{#1 — \newline #2}
\else
	\newcommand{\certif}[2]{#1 – \newline #2}
\fi
\newcommand{\sectionline}{\noindent\makebox[\linewidth]{{\color{\accentcolour}\rule{\linewidth}{1pt}}}}
\newcommand*\arrowhref[2]{\href{#1}{#2\textsuperscript{\tikz[baseline=(char.base)]{
	\node[shape=circle,fill=\accentcolour,inner sep=0.5pt] (char) {\textcolor{white}{\scshape\bfseries\tiny ↗}};}}}
}
% Insert title
\def\maketitle{
	\noindent
	\thispagestyle{empty}
	\begin{tabular}{@{}>{\raggedright\arraybackslash}b{0.8\linewidth-\gap}>{\raggedleft\arraybackslash\setlength{\baselineskip}{0.6\baselineskip}}b{0.2\linewidth}@{}}
		{\Huge\bfseries \@info@name
		}
		& {\scriptsize \@info@updatenote}
	\end{tabular} \par\vspace{0.5\baselineskip}
	\sectionline
	\noindent{
	\renewcommand{\arraystretch}{1}
	\begin{tabular}{@{}R{\lmarginwidth + 0.2\gap}P{\linewidth - \lmarginwidth - 1.2\gap}@{}}
		\ifdefined\@info@mail
			\MakeUppercase\@info@mail@title \hspace{0.2\gap} & \arrowhref{mailto:\@info@mail}{\@info@mail} \\
		\fi
		\ifdefined\@info@website
			\MakeUppercase\@info@website@title \hspace{0.2\gap} & \arrowhref{\@info@website}{\@info@website} \\
		\fi
		\ifdefined\@info@phone
			\MakeUppercase\@info@phone@title \hspace{0.2\gap} & \@info@phone \\
		\fi
		\ifdefined\@info@institute
			\MakeUppercase\@info@institute@title \hspace{0.2\gap} & \@info@institute \\
		\fi
		\ifdefined\@info@address
			\MakeUppercase\@info@address@title \hspace{0.2\gap} & \@info@address \\
		\fi
	\end{tabular}
	}
}

%% Table items
% Sections
\usepackage{longtable}
\newenvironment{cvsection}[1][]{%
	\section*{#1}%
	\begin{tabular}{@{}T{}@{}C{}I{}@{}}%
}{
	\end{tabular}
}
\newenvironment{cvsection*}[1][]{%
	\begin{tabular}{@{}T{}@{}C{}I{}@{}}%
}{
	\end{tabular}
}
% Timeline
\def\xlocation{-0.4}
\newcommand{\timeline}[2]{
	\begin{tikzpicture}[x={\gap}, y={\baselineskip}, baseline={(base.base)}]
		\draw[white] (0,0) -- (0.7,0);
		\node[text width=4pt, inner sep=0pt, outer sep=0pt, fill=\accentcolour, circle] () at (0,0) {};
		\node[text width=4pt, inner sep=0pt, outer sep=0pt, fill=\accentcolour, circle] () at (0,-1) {};
		\node[align=right, anchor=mid east, yshift=-1pt, inner sep=0pt, outer sep=0pt] (base) at (\xlocation,0) {\uppercase{#2}};
		\node[align=right, anchor=mid east, yshift=-1pt, inner sep=0pt, outer sep=0pt] () at (\xlocation,-1) {\uppercase{#1}};
		\draw[\accentcolour, thick] (0,0) -- (0,-1);
	\end{tikzpicture}
}
\newcommand{\timepoint}[1]{
	\begin{tikzpicture}[x={\gap}, y={\baselineskip}, baseline={(base.base)}]
		\draw[white] (0,0) -- (0.7,0);
		\node[text width=4pt, inner sep=0pt, outer sep=0pt, fill=\accentcolour, circle] (base) at (0,0) {};
		\node[align=right, anchor=mid east, yshift=-1pt, inner sep=0pt, outer sep=0pt] (base) at (\xlocation,0) {\uppercase{#1}};
	\end{tikzpicture}
}

% Events
\RequirePackage{listofitems, etoolbox}
\newcommand{\event}[5]{\noindent%
	\begin{tabular}{@{}T{}@{}C{}I{}@{}}
		\let\timestring\undefined%
		\newcommand{\timestring}{#1}%
		\readlist*\timelist{\timestring}%
		\ifnum\listlen\timelist[]=1 %
			\timepoint{\MakeUppercase{\timelist[1]}}%
		\else %
			\timeline{\MakeUppercase{\timelist[1]}}{\MakeUppercase{\timelist[2]}}%
		\fi% date
		& \textbf{#2}% position
		\ifx\relax#3\relax\else , #3 \fi% event
		\newline #4 % description
		& #5 % host
	\end{tabular}
	\newline
}