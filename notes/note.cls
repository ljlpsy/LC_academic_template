%-------------------------------------------------------------------
% This is my second package aims at writing note in a easier way.
% My purpose is to just use one package to write note.
% Make my code clean and neat.
% Keep modest and keep updating.
% Author: Jialing Li
% Version: 0.1.0
% Date: 2021-03-10
%-------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{note}[2021/03/10 v0.1.0 Help you write your note easier.]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[
    fontset = fandol,
    a4paper,
    oneside,
    openright
]{article}

%----------------------------------------%
%----------- Package Required -----------%
%----------------------------------------%
%------------- Math Formula -------------%
\RequirePackage{amsmath}
%-------- Draw Or Import Graphic --------%
\RequirePackage{graphicx}
\RequirePackage{subfigure}
\RequirePackage{caption}
\RequirePackage{tikz}
\RequirePackage{tikz-3dplot}
\RequirePackage{epstopdf}
%-------- Geometry And Sturcture --------%
\RequirePackage[
    left=1cm,
    top=2cm,
    right=3cm,
    bottom=2cm,
    headsep=.2in,
    headheight=2in,
    marginpar=2.8cm,
    marginparsep=2mm
]{geometry}
\RequirePackage{float}
\RequirePackage{fancyhdr}
\RequirePackage{indentfirst}
\RequirePackage{booktabs}
\RequirePackage{titlesec}  % Customize your title of section
%------------- Fonts Setting -------------%
\RequirePackage{fontspec}
\setmainfont{Times New Roman}
%----------- Hyperlink Package -----------%
\RequirePackage{hyperref}

%-----------------------------------------%
%----------- Define Page Style -----------%
%-----------------------------------------%
\pagestyle{fancy}
\renewcommand{\sectionmark}[1]{\markboth{#1}{}}
\fancypagestyle{plain}{
    \renewcommand{\headrulewidth}{1pt}
    \renewcommand{\footrulewidth}{0pt}
    \fancyhf{}
    \fancyfoot[C]{\thepage}
    \fancyhead[L]{Title: \@dtitle\\
                  Section: \leftmark}
}

\fancypagestyle{title}{
    %% WARNING: Geometry below will cause strange error at footrule. Maybe need a better way to do this!!!
    %% Fixed in geometery settings
    %\newgeometry{
    %    left=1cm,
    %    top=0.5cm,
    %    right=3cm,
    %    bottom=1cm,
    %    headsep=.2in,
    %    headheight=2in,
    %    marginpar=1cm,
    %    marginparsep=5mm
    %}
    \renewcommand{\top}{0.5cm}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
    \fancyhf{}
    \fancyfoot[C]{\thepage}
}

%----------------------------------------%
%------------ Set Title Info ------------%
%----------------------------------------%
\newcommand{\dauthor}[1]{\def\@dauthor{#1}}
\newcommand{\dtitle}[1]{\def\@dtitle{#1}}
\newcommand{\dinstitute}[1]{\def\@dinstitute{#1}}
\newcommand{\demail}[1]{\def\@demail{#1}}
\newcommand{\dtel}[1]{\def\@dtel{#1}}
\renewcommand{\maketitle}{
    \thispagestyle{title}
    \noindent
    \begin{tikzpicture}
        \node[
            rectangle,
            rounded corners=10pt,
            inner sep=10pt,
            fill=blue!50!black,
            text width=0.95\textwidth
        ]{
            \color{white}
            \textbf{\huge{\@dtitle}}\\
            \vspace{\baselineskip}
            \textbf{\large{\@dauthor}}\\
            \today \\
            \vspace{0.5\baselineskip}
            \textbf{Email:}\@demail \qquad \textbf{Tel:}\@dtel\\
        };
    \end{tikzpicture}
}

%\titleformat{\section}
%-----------------------------------------%
%----------- Geometry Settings -----------%
%-----------------------------------------%
\renewcommand{\baselinestretch}{1.2}
\setlength{\parindent}{1em}
\AtBeginDocument{
    %\newgeometry{
    %    left=1cm,
    %    top=0.5cm,
    %    right=4cm,
    %    bottom=2cm,
    %    headsep=.2in,
    %    headheight=2in,
    %    marginpar=3.5cm,
    %    marginparsep=5mm
    %}
    \hypersetup{
        colorlinks = true,
        linkcolor = blue,
        filecolor = magenta,
        urlcolor = cyan,
    }
    \maketitle
    \pagestyle{plain}
}
%----------------------------------------%
%---------- Structure Settings ----------%
%----------------------------------------%
%------- The Number Of Everything -------%
\renewcommand{\theequation}{\arabic{section}.\arabic{equation}}
\renewcommand{\thetable} {\arabic{section}.\arabic{table}}
\renewcommand{\thefigure} {\arabic{section}.\arabic{figure}}

%-----------------------------------------%
%------------ Pargin Settings ------------%
%-----------------------------------------%
\newcommand{\nmarginpar}[1]{
    \marginpar{
        \noindent
        \scriptsize
        \tikz
        \node[
            rectangle,
            rounded corners,
            inner sep=2pt,
            fill=-red!75!green,
            text width=2.5cm
        ]{#1};
    }
}

\newcommand{\wmarginpar}[1]{
    \marginpar{
        \noindent
        \scriptsize
        \tikz
        \node[
            rectangle,
            rounded corners,
            inner sep=2pt,
            fill=orange,
            text width=2.5cm
        ]{Unsolved:\\
          #1};
    }
}

