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
\LoadClassWithOptions{article}

%% Load custom packages
\RequirePackage{etoolbox}
\RequirePackage{default}

%% Class-specific settings
\mail{williameclee@arizona.edu}
\information{\today}
\def\accentcolour{black}
%\renewcommand{\thesubsection}{\arabic{subsection}}
% Title page

% title
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
		\raggedright
		\setlength\parindent{2\@document@fontsize}
	}
}


% Header and footer settings
\pagestyle{homework@plain}


%% Language settings
\RequirePackage{xstring}
\IfSubStr{\@document@language}{chinese}{
	\author{李恩齊\ En-Chi\ Lee}
}{
%	\usepackage[english]{babel}
	\author{En-Chi (William) Lee}
}