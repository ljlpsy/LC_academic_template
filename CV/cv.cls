%-------------------------------------------------------------------
% This is a package aims at writing CV in a easier way.
% My purpose is to just use one package to write my CV.
% Make my code clean and neat.
% Author: Jialing Li
% Version: 0.1.0
% Date: 2021-03-09
%-------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2021/03/09 v0.1.0 Init version of CV]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[
    fontset = fandol,
    a4paper
]{article}
%----------------------------------------%
%----------- Package Required -----------%
%----------------------------------------%
%---------- Required For Table ----------%
\RequirePackage{array}
\RequirePackage{tabularx}
%----------- Set The Geometry -----------%
\RequirePackage[left   = 0.45in,
                right  = 0.45in,
                top    = 0.5in,
                bottom = 0.5in]{geometry}
%------------- Fonts Setting -------------%
\RequirePackage{fontspec}
\setmainfont{Times New Roman}
%------------- Item Settings -------------%
\RequirePackage{enumitem}
%-------- Section Titles Settings --------%
\RequirePackage{titlesec}
%----------------------------------------%
%--------------- Settings ---------------%
%----------------------------------------%
% Page style
\pagestyle{empty}
\setlength{\parindent}{0pt}
\titlespacing*{\section}{0pt}{0.7em}{0.2em}
% List style
\setlist{nosep}
%----------------------------------------%
%------------ Set Title Info ------------%
%----------------------------------------%
\newcommand{\dname}[1]{\def\@dname{#1}}
\newcommand{\dinfo}[1]{\def\@dinfo{#1}}
\renewcommand{\maketitle}{
    \begin{center}
        \textbf{\huge{\@dname}}\\
        \vspace{0.5\baselineskip}
        \@dinfo
    \end{center}
}
%----------------------------------------%
%-------------- Auto Title --------------%
%----------------------------------------%
\AtBeginDocument{
    \maketitle
}
%-----------------------------------------%
%--------------- Cvsection ---------------%
%-----------------------------------------%
\newcommand{\xfilll}[2][1em]{
\dimen0=#2\advance\dimen0 by #1
\leaders\hrule height \dimen0 depth -#1\hfill}
\titleformat{\section}{\Large\scshape\raggedright}{}{0em}{}
