\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2024/02/20]


%% Declare options
\input{options.def}
% Reports and title page
\def\@document@reporttype{false}
\DeclareOption{report}{\def\@document@reporttype{true}}
\DeclareOption{mla}{\def\@document@reporttype{mla}\def\@document@citation{mla}}
\DeclareOption{engl}{\def\@document@reporttype{english}\PassOptionsToClass{12pt}{article}}
% Pass on options to article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClassWithOptions{article}

%% Load custom packages
\RequirePackage{etoolbox}
\RequirePackage{default}

%% Class-specific settings
\mail{williameclee@arizona.edu}
\information{\today}
\def\accentcolour{black}

% Header and footer settings
\f@nch@setoffs
\pagestyle{homework@plain}

% Title
\input{maketitle.def}
\IfEqCase{\@document@reporttype}{
	{false}{\let\maketitle\maketitle@homework@short}
	{true}{\let\maketitle\maketitle@homework@titlepage}
	{mla}{\let\maketitle\maketitle@homework@mla
		\setstretch{2}
		\captionsetup{font=sf}
		\titleformat{\section}{\sffamily\Large\bfseries\setstretch{1}}{\thesection}{}{}
		\titlespacing*{\section}{0em}{\baselineskip}{0.25\baselineskip}
		\setlength{\@document@margin@horizontal}{1in}
		\setlength{\@document@margin@vertical}{1in}
		\raggedright%
		\setlength\parindent{2\@document@fontsize}
	}
	{english}{
		\let\maketitle\maketitle@homework@english
		\setstretch{2}
		\raggedright
		\setlength\parindent{0.5in}
		\setlength{\@document@margin@horizontal}{2\parindent}
		\setlength{\@document@margin@vertical}{2\parindent}
		\@document@geometry
		\f@nch@setoffs
		\pagestyle{homework@english}
	}
}


%% Language settings
\RequirePackage{xstring}
\IfSubStr{\@document@language}{chinese}{
	\author{李恩齊\ En-Chi\ Lee}
}{
%	\usepackage[english]{babel}
	\author{En-Chi (William) Lee}
}