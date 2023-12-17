\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2022/12/28 initial commit]

%% Declare options
\input{option.def}
% Reports and title page
\gdef\@document@reporttype{false}
\DeclareOption{report}{\gdef\@document@reporttype{true}}
\DeclareOption{mla}{\gdef\@document@reporttype{mla}}
% Pass on options to article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

%% Load custom packages
\RequirePackage{etoolbox}
\RequirePackage{default}

%% Class-specific settings
\mail{williameclee@arizona.edu}
\information{\today}
\def\accentcolour{black}
%\renewcommand{\thesubsection}{\arabic{subsection}}
% Title page
\IfEqCase{\@document@reporttype}{
	{false}{
		\def\maketitle{%
			\thispagestyle{empty}%
			\fancyhf[FC]{\makebox[\textwidth][c]{\sffamily\footnotesize\thepage}}%
				\noindent
				\begin{tabular}{@{}>{\raggedright\arraybackslash}b{0.75\linewidth}@{}>{\raggedleft\arraybackslash\setlength{\baselineskip}{0.6\baselineskip}}b{0.25\linewidth}@{}}
				\setstretch{0.9}
				{\ifdefined\@info@subtitle
					{\noindent\small\@info@subtitle}\linebreak 
				\fi
				\LARGE\bfseries\@info@title
				}
				& 
				\setstretch{0.9}
				{\scriptsize\sffamily
				\ifdefined\@info@mail
					\href{mailto:\@info@mail}{\@info@author}
				\else
					\@info@author
				\fi \linebreak 
				\ifdefined\@info@additionalinfo
					\@info@additionalinfo
				\else
					\today
				\fi
				}
			\end{tabular}
			\linebreak%
			\vspace{0.5\baselineskip}%
			\normalfont\noindent%
		}
	}
	{true}{
		\def\maketitle{%
			\begin{titlepage}
				\thispagestyle{empty}%
				\newgeometry{inner=2cm, outer=2cm, bottom=2cm, top=2cm, marginparwidth=0cm, marginparsep=0cm, includemp}
				\centering
				\null\vfill
				{\setstretch{1}\large\sffamily\@info@subtitle} \\
				\vspace{0.5\baselineskip}
				{\Huge\sffamily\bfseries\@info@title} \\
				\ifdefined\@info@additionalinfo
					\vfill
					\ifdefined\@info@mail
						\href{mailto:\@info@mail}{\textbf{\@info@author}} \\
					\else
						\textbf{\@info@author} \\
					\fi
					\vfill
					\@info@additionalinfo
					\vfill
				\else
					\vfill\vfill
					\setstretch{1}
					\ifdefined\@info@mail
						\href{mailto:\@info@mail}{\@info@author}
					\else
						\@info@author
					\fi
				\fi
				\vfill
			\end{titlepage}
			\restoregeometry
		}
	}
	{mla}{
		\setstretch{2}
		\captionsetup{font=sf}
		\titleformat{\section}{\sffamily\Large\bfseries\setstretch{1}}{\thesection}{}{}
		\titlespacing*{\section}{0em}{\baselineskip}{0.25\baselineskip}
		\geometry{
			inner=1in, outer=1in, bottom=1in, top=1in,
		}
		\raggedright
		\setlength\parindent{2\textsize}
		\def\maketitle{%
			{\footnotesize\sffamily\setstretch{1}
			\thispagestyle{empty}
			\fancyhf[FC]{\makebox[\textwidth][c]{\sffamily\footnotesize\thepage}}
			\noindent
			\begin{minipage}{\linewidth}
				\raggedright
				\ifdefined\@info@subtitle
					\@info@subtitle
					\vspace{0.4\baselineskip}\linebreak
				\fi
			\end{minipage}
			\begin{minipage}{\linewidth}
				\centering
				{\LARGE\bfseries\@info@title} \vspace{0.4\baselineskip}\linebreak
				\ifdefined\@info@mail
					\href{mailto:\@info@mail}{\@info@author}
				\else
					\@info@author
				\fi \linebreak 
				\ifdefined\@info@additionalinfo
					\@info@additionalinfo
				\else
					\today
				\fi
			\end{minipage}
			}
			\vspace{0.5\baselineskip}
		}
	}
}


% Header and footer settings
\makeatletter
\fancypagestyle{plain}{%
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
	\fancyhf{}
	\fancyhead[L]{\sffamily\footnotesize\@info@title@short}
	\fancyhead[R]{
		\ifdefined\info@mail
			\href{mailto:\interfootnotelinepenalty@mail}{\sffamily\footnotesize\@info@author}
		\else
			\sffamily\footnotesize\@info@author
		\fi
	}
	\fancyfoot[L]{
		\ifdefined\@info@link
			\begin{minipage}{0.6\linewidth}
			\raggedright
			\sffamily\tiny\url{\@info@link}
			\end{minipage}
		\fi
	}
	\fancyfoot[R]{
		\ifdefined\@info@link
			\sffamily\footnotesize\thepage
		\fi
	}
	\fancyfoot[C]{
		\ifdefined\@info@link\else
			\sffamily\footnotesize\thepage
		\fi
	}
}
\makeatother
\pagestyle{plain}


%% Language settings
\RequirePackage{xstring}
\IfSubStr{\@document@language}{chinese}{
	\author{李恩齊\ En-Chi\ Lee}
}{
%	\usepackage[english]{babel}
	\author{En-Chi (William) Lee}
}