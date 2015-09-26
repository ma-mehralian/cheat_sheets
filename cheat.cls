\ProvidesClass{cheat} [2014/05/19 My cheat sheets style]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption*{\PassOptionsToClass{10pt,landscape,a4}{article}}
\ProcessOptions \relax
\LoadClass{article} % Font size and paper type

%----------------------------------------------------------------------------------------
%	List of Packages
%----------------------------------------------------------------------------------------
\RequirePackage{multicol}
\RequirePackage{calc}
\RequirePackage{ifthen}
\RequirePackage[landscape]{geometry}
\RequirePackage{amsmath,amsthm,amsfonts,amssymb}
\RequirePackage{color,graphicx,overpic}
\RequirePackage{hyperref}

\RequirePackage{tikz}
\usepackage{pgfplots}
\usetikzlibrary{automata,positioning}	% Plot Automata with TikZ
\RequirePackage{tabularx}
\RequirePackage{array}

\RequirePackage{enumitem}		% Required for remove list indentation
\RequirePackage{pifont}				% Required for Special symbols
\RequirePackage{verbatim} 		% Required for comment block
\RequirePackage{etoolbox}

%----------------------------------------------------------------------------------------
%	PAGE LAYOUT
%----------------------------------------------------------------------------------------
% This sets page margins to .5 inch if using letter paper, and to 1cm
% if using A4 paper. (This probably isn't strictly necessary.)
% If using another size paper, use default 1cm margins.
%\ifthenelse{\lengthtest { \paperwidth = 11in}}
%    { \geometry{top=.5in,left=.5in,right=.5in,bottom=.5in} }
%    {\ifthenelse{ \lengthtest{ \paperwidth = 297mm}}
%        {\geometry{top=1cm,left=1cm,right=1cm,bottom=1cm} }
%        {\geometry{top=1cm,left=1cm,right=1cm,bottom=1cm} }
%    }
\geometry{top=1cm, left=1cm, right=1cm, bottom=1cm}
\pagestyle{empty} % Turn off header and footer

%----------------------------------------------------------------------------------------
%	SPACING
%----------------------------------------------------------------------------------------
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt plus 0.5ex}

\setlist[itemize]{nolistsep, leftmargin=1em}
\setlist[enumerate]{nolistsep, leftmargin=1.5em}

\AtBeginEnvironment{bmatrix}{\setlength{\arraycolsep}{2pt}\def\arraystretch{1}}
\AtBeginEnvironment{matrix}{\setlength{\arraycolsep}{2pt}\def\arraystretch{1}}
\AtBeginEnvironment{array}{\setlength{\arraycolsep}{2pt}\def\arraystretch{1}}
\AtBeginEnvironment{tabular}{\setlength{\tabcolsep}{2pt}\def\arraystretch{1}}

%\let\oldcenterline\centerline
%\renewcommand\centerline[1]{\oldcenterline{\parskip #1}}
\newlength\gapspace
\setlength{\gapspace}{0.35\columnwidth}
\newcommand{\tab}[1]{\makebox[\gapspace][l]{#1}}

%----------------------------------------------------------------------------------------
%	DOCUMENT
%----------------------------------------------------------------------------------------
\def \TitleText {
	\centerline{\tiny In the name of God, the Compassionate, the Merciful}
	\centerline{\Large \MakeUppercase{ \@title }}\vspace{2pt} \hrule
}

\AtBeginDocument {
	\definecolor{darkblue}{RGB}{0,0,70}
	\hypersetup{
		pdftitle={\@title},
		pdfauthor={\@author},
		pdfsubject={\@title},
		pdfstartview={FitH},
		colorlinks=true,
		urlcolor=darkblue,
		linkcolor=darkblue
	}
	\TitleText 
	\def\arraystretch{1.5}
	%Document font size
	%\small
	\footnotesize
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------
% Don't print section numbers
\setcounter{secnumdepth}{0}

\makeatletter
\renewcommand\section{%
\@startsection{section}{1}
	{\z@}%
	{-.5ex \@plus -1ex \@minus -.2ex}%
	{1sp}% No space after subsection
	{\ruled@section}%
}
\newcommand{\ruled@section}[1]{%
	{\noindent \colorbox[rgb]{0.75,0.75,0.75}{
		\begin{minipage}{\hsize}
			\centerline{\large\bfseries{#1}}
		\end{minipage}}
	}
}
%%%%%%%%%%%%%%
\renewcommand\subsection{%
\@startsection{subsection}{1}
	{\z@}%
	{-.5ex\@plus -1ex \@minus -.2ex}%
	{0ex}% No space after subsection
	{\ruled@subsection}%
}
\newcommand{\ruled@subsection}[1]{%
	{\noindent \colorbox[rgb]{0.85,0.85,0.85}{
		\begin{minipage}{\columnwidth}
			\normalfont\normalsize\bfseries{#1}
		\end{minipage}}
	}
}
%%%%%%%%%%%%%%%
\renewcommand\subsubsection{%
\@startsection{subsubsection}{1}
	{\z@}%
	{-3.25ex\@plus -1ex \@minus -.2ex}%
	{1sp}% No space after subsection
	{\ruled@subsubsection}%
}
\newcommand{\ruled@subsubsection}[1]{%
	{\noindent \colorbox[rgb]{0.95,0.95,0.95}{
		\begin{minipage}{\columnwidth}
			\normalfont\small\bfseries{#1}
		\end{minipage}}
	}
}
\makeatother