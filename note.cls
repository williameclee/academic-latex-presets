\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{note}[2023/11/28]

%% Declare options
\input{option.def}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

%% Load custom packages
\RequirePackage{default}

\def\accentcolour{myblue}
\def\lightcolour{mybluelight}
\def\secondarycolour{mygreen}

% Title page
\input{maketitle.def}
\let\maketitle\maketitle@note@titlepage

% Label settings
\numberwithin{equation}{section}
\numberwithin{table}{section}
\numberwithin{figure}{section}


\RequirePackage{sectsty}
\setcounter{tocdepth}{2}