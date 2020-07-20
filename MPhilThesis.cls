% based on https://www.oxfordechoes.com/oxford-thesis-template/

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mphilthesis}[2020/07/20 MPhil class]


\newif\iftwosupervisors
\twosupervisorsfalse

\DeclareOption{twosupervisors}{\twosupervisorstrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[titlepage]{article}

\RequirePackage{amsmath}
\RequirePackage{graphicx}
\RequirePackage[%
colorlinks = true,
linkcolor = blue,
urlcolor  = blue,
citecolor = blue,
anchorcolor = blue]{hyperref} 	
\RequirePackage[longnamesfirst, authoryear]{natbib}
\RequirePackage{amsthm,thmtools,thm-restate}
\RequirePackage{appendix}




% --------------------- --------------
% layout
% -----------------------------------
% \numberwithin{equation}{section}
\newtheoremstyle{mytheorem}%                % Name
  {}%                                     % Space above
  {}%                                     % Space below
  {\itshape}%                             % Body font
  {}%                                     % Indent amount
  {\scshape}%                            % Theorem head font
  {.}%                                    % Punctuation after theorem head
  { }%                                    % Space after theorem head, ' ', or \newline
  {}%                                     % Theorem head spec (can be left empty, meaning `normal')

  \newtheoremstyle{mydef}%                % Name
  {}%                                     % Space above
  {}%                                     % Space below
  {\normalfont}%                             % Body font
  {}%                                     % Indent amount
  {\scshape}%                            % Theorem head font
  {.}%                                    % Punctuation after theorem head
  { }%                                    % Space after theorem head, ' ', or \newline
  {}%                                     % Theorem head spec (can be left empty, meaning `normal')

\theoremstyle{mytheorem}
\newtheorem{prop}{Proposition}
\newtheorem{corollary}{Corollary}
\newtheorem{conjecture}{Conjecture}
\newtheorem{lemma}{Lemma}

\theoremstyle{mydef}
\newtheorem{definition}{Definition}
\newtheorem{assumption}{Assumption}
\newtheorem{remark}{Remark}

% Math macros
\newcommand{\indic}[1]{\mathbf{1}_{#1}}
\newcommand{\SW}{\mathbb{W}}
\renewcommand{\Pr}{\mathrm{P}}
\newcommand{\half}{\frac{1}{2}}
\newcommand{\norm}[1]{\left\lVert#1\right\rVert}
\newcommand{\red}[1]{\textcolor{red}{#1}}

% Create Titlepage
\def\degree#1{\gdef\@degree{#1}}
\def\degreedate#1{\gdef\@degreedate{#1}}

\def\college#1{\gdef\@college{#1}}
\def\university#1{\gdef\@university{#1}}
\def\logourl#1{\gdef\@logourl{#1}}


\def\supervisor#1{\gdef\@supervisor{#1}}
\def\affiliation#1{\gdef\@supafil{#1}}

\def\supervisorB#1{\gdef\@supervisorB{#1}}
\def\affiliationB#1{\gdef\@supafilB{#1}}



\newcommand{\submittedtext}{{Thesis submitted in partial fulfilment of the requirements for the Degree of}}
\newcommand{\mylogo}{
    {\includegraphics[width = 0.4\textwidth]{\@logourl} }
    % {\includegraphics[width = 0.49\textwidth]{logos/uvalogo_regular_compact_p_en.eps}}
    }

% supervisor depending on whether one or two
\iftwosupervisors
\newcommand{\thesupervisors}{\begin{tabular}{cc}
  {\Large\@supervisor} & {\Large\@supervisorB}\\
  \@supafil & \@supafilB
\end{tabular}}
\else
\newcommand{\thesupervisors}{
  {{\Large\@supervisor} \par}
  \vspace*{1ex} 
  {{\@supafil}\par}
}
\fi

\renewcommand{\maketitle}{%
\null
\thispagestyle{empty}
\begin{center}
  { \LARGE {\bfseries {\@title}} \par}
{\large \vspace*{20mm} 
{\mylogo \par} 
\vspace*{20mm}}
{\itshape {written by} \par}
\vspace*{2ex}
  {{\Large \@author} \par}
{\large \vspace*{1ex}
  {{\@college} \par}
\vspace*{1ex}
  {\@university \par}
\vspace*{15mm}
  {\itshape {supervised by} \par}
  \vspace*{2ex}
  {\thesupervisors \par}
\vspace*{20mm}
  {{\submittedtext} \par}
\vspace*{1ex}
  {\it {\@degree} \par}
\vspace*{2ex}
  {Amsterdam, August 2020}}
\end{center}
\vfill\null}
