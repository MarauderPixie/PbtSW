\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Shadowrun}[2020/10/19 Shadowrun 6 LaTeX class]      

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Optionen
%%%

%%% Farben
\newcommand{\headlinecolor}{\normalcolor}
\RequirePackage[table]{xcolor}
\definecolor{purplefont}{HTML}{94096a}
\definecolor{purplerule}{HTML}{9e247a}
\definecolor{purpletitle}{HTML}{bd0c8e}
\definecolor{grayframe}{HTML}{959280}
\definecolor{graybox}{HTML}{b6b4a9} %{e0dfda}
\DeclareOption{green}{\renewcommand{\headlinecolor}{\color{green}}}
\DeclareOption{red}{\renewcommand{\headlinecolor}{\color{slcolor}}}


% \DeclareOption{onecolumn}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[twocolumn, 10pt]{report}


\RequirePackage{epigraph}
\RequirePackage[ngerman,english]{babel} % Festlegung der Sprache auf Deutsch (als Hauptsprache) und Englisch. Wichtig z. B. für Trennung von Wörtern
%\RequirePackage{parskip}
%\setlength{\parskip}{1em}
\setcounter{secnumdepth}{0}



%%% Seitenränder
\RequirePackage{geometry}
\geometry{a4paper,          %%% evtl. nochmal anpassen, circa:
          left   = 1.8cm,   % 2cm
          right  = 2.8cm,   % 3cm
          top    = 1.8cm,   % 1.4cm oder 1.5cm
          bottom = 2.4cm,   % 1.6cm
          footskip = 1.8cm  % muss bestimmt entsprechend der Änderungen...
} 




%%% Fonts
\renewcommand{\normalsize}{\fontsize{10}{12}\selectfont}
\RequirePackage{fontspec}
\setmainfont{SabonLTStd}[
    Path        = fonts/ ,
    Extension   = .otf,
    UprightFont = *-Roman,
    BoldFont    = *-Bold,
    ItalicFont  = *-Italic
    ]
% use Switzerland instead of Amplitude for now bc Umlaute :()
% \setsansfont{SwitzerlandCondensed}[
%     Path        = fonts/ ,
%     Extension   = .ttf,
%     UprightFont = *_Regular,
%     BoldFont    = *_Bold,
%     ItalicFont  = *_Italic
%     ]
\setsansfont{Amplitude}[
    Path        = fonts/ ,
    Extension   = .ttf,
    UprightFont = *-Regular,
    BoldFont    = *-Bold
    ]




%%% ToC Layout
\usepackage{titletoc}

\titlecontents{chapter}
              [0pt]             % left margin
              {\addvspace{1em}} % code für "before entry"
              {\fontspec{Njord.otf}\large\color{purplefont}}
              {}
              {\fontspec{Njord.otf}\large\color{purplefont}\titlerule*[2.6pt]{.}\contentspage}
              
\titlecontents{section}
              [1em]
              {}
              {\sffamily\bfseries}  % format _numbered_ entries
              {\sffamily\bfseries}  % format _unnumbered_ entries
              {\sffamily\bfseries\titlerule*[3.6pt]{.}\contentspage} % dots zw. Titel und Seitenzahl
              
\titlecontents{subsection}
              [2em] 
              {}
              {\sffamily\small}
              {\sffamily\small}
              {\sffamily\small\titlerule*[2.6pt]{.}\contentspage}

% multiple columns
\usepackage[toc]{multitoc}
\renewcommand*{\multicolumntoc}{2}



    
%%% Überschriften
\RequirePackage[calcwidth, noindentafter, rigidchapters]{titlesec}
\RequirePackage{tikz}

% \titlespacing{\chapter}{0mm}{60mm}{48mm} % okay-ish spacing for option <rubberchapters>
\titlespacing{\chapter}{0mm}{60mm}{90mm} % spacing for option <rigidchapters>
\titleformat{\chapter}[display]%         <command>: which headline to edit
    {\centering
     %\fontsize{14.838mm}{17.806mm}
     \fontsize{18mm}{17.806mm} % eher 8mm? und dann is titlespacing aber wieder borked
     \fontspec{Njord.otf}
     \color{white}
    }%                          <format>:  how should it look
    {\tikz[remember picture,overlay] 
        \node[inner sep=0pt,anchor=north] at (current page.north)%
        {\includegraphics[width=\paperwidth,height=\paperheight]%
        {Kapitel.jpg}};
    }%                          <label>:   what gets "printed"
    {0pt}%                      <sep>:     horizontal seperation between label & body
    {}
%    {\titleline{\color{purplerule}\titlerule[3pt]}}%
%        [\titleline{\color{purplerule}\titlerule[3pt]}]
                        % <before-code>:   code preceding the title body


\titlespacing{\section}{0em}{2.2em}{1.5em} % <left><before><after>
\titleformat{\section}%
    {\fontspec{Njord.otf}\huge}{\thesection}{}
    {}[\titleline{\color{purplerule}\titlerule[3pt]}]
    
    
\titlespacing{\subsection}{0em}{1.2em}{0.3em}
\titleformat{\subsection}%
    {\fontspec{Njord.otf}\Large}{\thesubsection}{}
    {}
    %{}[\color{purplerule}\vspace{-1em}\rule{\titlewidth}{1pt}]

   
\titlespacing{\subsubsection}{0em}{1em}{0.2em}
\titleformat{\subsubsection}%
    {\fontspec{Njord.otf}\large}{\thesubsubsection}{}{}


    \titlespacing{\paragraph}{0em}{1.5em}{0.5em}
    \titleformat{\paragraph}[runin]%
        {\fontspec{Njord.otf}\large\color{purplefont}}{}{1em}{}
        
    \titlespacing{\subparagraph}{0.8em}{0em}{0.5em}
    \titleformat{\subparagraph}[runin]% 
        {\sffamily\normalsize\bfseries}{\thesubparagraph}{}{}




%%% Seitenzahlenposition und Hintergrundbild
\RequirePackage{eso-pic}

\newcommand{\makebackground}{%
    \AddToShipoutPictureBG{%
        \includegraphics[width=\paperwidth,height=\paperheight]%
            {Hintergrund.jpg}
        
        \begin{tikzpicture}[remember picture, overlay]
            \draw ([xshift=9.9cm,yshift=8.5cm]current page.center) node[rotate=270] 
                {\fontsize{11}{13}\fontspec{Njord.otf}\textcolor{purpletitle}{Shadowrun: Sechste Welt}};
        \end{tikzpicture}
    }
}




%%% Headers & Footers
\newcommand{\footslash}{\hspace{8pt}//\hspace{8pt}}
\RequirePackage{fancyhdr}

% zeigt Section-Namen auch auf Kapitelanfangs-Seiten an
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{%
    \markboth{#1}{\noexpand\firstsectiontitle}\global\firstsectionmarktrue
}
\renewcommand{\sectionmark}[1]{%
    \markright{#1}%
    \iffirstsectionmark
        \gdef\firstsectiontitle{#1}%
    \fi
    \global\firstsectionmarkfalse
}
\newif\iffirstsectionmark
\def\firstsectiontitle{}

% reguläre Seiten
\fancyhf{}
\fancyfoot[R]{
    \fontspec{Njord.otf}\textcolor{purplefont}{
        {\rightmark}\footslash
        {\large\leftmark}\footslash
        {\large\thepage}
    }
}
%\fancyhead[R]{
%    \rotatebox{270}{{%
%        \fontsize{11}{13}\fontspec{Njord.otf}\textcolor{purplefont}%
%            {\@title}
%        }
%    }
%}

\renewcommand{\headrulewidth}{0pt}
\fancyheadoffset{23mm} % rückt den Footer näher an den rechten Rand
\fancyfootoffset{23mm} % rückt den Footer näher an den rechten Rand

% Kapitel- und Titelseiten
\RequirePackage{extramarks}
\fancypagestyle{plain}{%
    \fancyhf{}  % clear all header and footer fields
    \fancyfoot[R]{
        \fontspec{Njord.otf}\textcolor{purplefont}{
            {\rightmark}\footslash
            {\large\leftmark}\footslash
            {\large\thepage}
        }
    }
}



    
%%% Title Page
\newcommand{\customtitle}{%
    \begin{titlepage}
%        {\tikz[overlay] 
%            \node[inner sep=0pt,anchor=north] at (current page.north)%
%            {\includegraphics[width=\paperwidth,height=\paperheight]%
%            {Titel.jpg}};
%        }
        \AddToShipoutPictureBG*{%
            \includegraphics[width=\paperwidth,height=\paperheight]%
                {Titel.jpg}
        }
        \vspace*{105mm}
        \centering
        \fontsize{18}{15}\fontspec{Njord.otf}\textcolor{white}{Powered By The} \\
        \vspace*{4mm}
        \fontsize{48}{35}\fontspec{Njord.otf}\textcolor{white}{Sixth World} \\
        % \@title \\
        \vspace*{9mm}
        \fontsize{21}{18}\fontspec{Njord.otf}\textcolor{white}{A homebrewed Shadowrun Hack}        
    \end{titlepage}
    \clearpage
}




%%% Makros
% für das Yen Symbol
\newcommand{\nuyen}{%
    ¥
}

% für Proben
\newcommand{\probe}[2]{%
    \textsf{\textbf{\color{purplefont}#1 (#2)}}%
}

% für Fertigkeiten
\newcommand{\skill}[1]{%
    \textsf{\textbf{#1}}%
}

% ~~für Textbox mit gestaffelten Proben~~
% some Textbox...
\RequirePackage{tcolorbox}
\tcbuselibrary{skins}

\newcommand{\textbox}[2]{%
    \begin{tcolorbox}[standard jigsaw,
                      colback   = graybox,
                      colframe  = grayframe, 
                      opacityback = 0.15,
                      sharp corners = all]
                      %coltitle  = purplefont,
                      %fonttitle = \fontspec{Njord.otf}\large,
                      %title     = #1]
        % \textsf{\textbf{#1}} \par
        {\fontspec{Njord.otf}\large\textcolor{purplefont}{#1}} \par
        \vspace{0.5em}
        {\fontsize{10}{12}\textsf{#2}}
    \end{tcolorbox}
}


% da ich das offenbar eh meist als Textbox mache, warum nicht etwas abkürzen?
% "Sag's ihnen ins Gesicht"-Textbox
\newcommand{\gesicht}[1]{%
    \begin{tcolorbox}[standard jigsaw,
                      colback   = graybox,
                      colframe  = grayframe, 
                      opacityback = 0.15,
                      sharp corners = all]
                      %coltitle  = purplefont,
                      %fonttitle = \fontspec{Njord.otf}\large,
                      %title     = #1]
        % \textsf{\textbf{#1}} \par
        {\fontspec{Njord.otf}\large\textcolor{purplefont}{Sag's ihnen ins Gesicht}} \par
        \vspace{0.5em}
        {\fontsize{10}{12}\textsf{#1}}
    \end{tcolorbox}
}


% single-cell alignment change in tables
% 1st argument: alignment (l/c/r)
% 2nd argument: cell content 
\newcommand{\lcr}[2]{\multicolumn{1}{#1}{#2}}


% Tabelle. Uff.
\usepackage{array}
% \usepackage{multirow}
\definecolor{graytbl}{HTML}{eaeae4}

\newcommand{\tbl}[2]{
    \textbox{#1}{
       {\rowcolors{1}{gray!30!white}{}
        \begin{tabular}{m{0.2\textwidth} m{0.7\textwidth}}
            #2
        \end{tabular}
       }
    }
}

% als Zeilenüberschrift:
%  {\fontspec{Njord.otf}{☯}}