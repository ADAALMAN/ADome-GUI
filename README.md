# ADome-GUI
A GUI for the ADome project

This GUI based in MATLAB uses the OCS from the ADome and makes it into a user friendly interface, where variables can be chosen.

```latex {cmd=true hide=true}
\documentclass{standalone}
\usepackage[utf8]{inputenc}
\usepackage{graphicx}
\usepackage{tikz}
\usetikzlibrary{shapes, arrows, positioning}

\begin{document}
    \tikzstyle{rect} = [draw, rectangle, fill=white!20,text width=6em, text centered, minimum height=2em]
    \tikzstyle{elli} = [draw, ellipse,fill=white!20,minimum height=2em]
    \tikzstyle{circ} = [draw, circle, fill=white!20,minimum width=8pt, inner sep=10pt]
    \tikzstyle{diam} = [draw, diamond,fill=white!20,text width=6em, text badly centered,inner sep=0pt]
    \tikzstyle{arrow} = [draw, -latex']
    \tikzstyle{line} = [draw]

    \begin{figure}
        \centering
        \scalebox{0.8}[0.8]{
            \begin{tikzpicture}[node distance = 1.5cm, auto]
            \node[rect, rounded corners] (step 1) {start};
            \node[rect, below of = step 1] (step 2) {Startup function};
            \node[rect, below of = step 2] (step 3) {Display COM ports};
            \node[rect, below of = step 3] (step 4) {Idle};
            \node[diam, below of = step 4, node distance = 2.5cm] (step 5) {Button pressed?};
            \node[diam, left of = step 5, node distance = 3.5cm] (step 17) {Edit field change?};
            \node[rect, below of = step 17, node distance = 5cm] (step 18) {Update value edit field};
            \node[diam, left of = step 17, node distance = 3.5cm] (step 6) {Is there new CMD data?};
            \node[rect, left of = step 6, node distance = 3.5cm] (step 7) {Wait 1s};
            \node[rect, below of = step 6, node distance = 2.5cm] (step 8) {Display new CMD data};
            
            \node[diam, below of = step 5, node distance = 3.5cm] (step 9) {Start button pressed?};
            \node[diam, below of = step 9, node distance = 3.5cm] (step 10) {Test button pressed?};
            \node[diam, below of = step 10, node distance = 3.5cm] (step 11) {View button pressed?};
            \node[diam, below of = step 11, node distance = 3.5cm] (step 12) {List button pressed?};
            
            \node[rect, right of = step 9, node distance = 3.5cm] (step 13) {Start OCS};
            \node[rect, right of = step 10, node distance = 3.5cm] (step 14) {Start test command};
            \node[rect, right of = step 11, node distance = 3.5cm] (step 15) {Display spherical model};
            \node[rect, right of = step 12, node distance = 3.5cm] (step 16) {Display coordinate list};
            
            \node[coordinate, right of = step 13, node distance = 2.5cm] (empty 1) {};
            \node[coordinate, right of = step 14, node distance = 2.5cm] (empty 2) {};
            \node[coordinate, right of = step 15, node distance = 2.5cm] (empty 3) {};
            \node[coordinate, right of = step 16, node distance = 2.5cm] (empty 4) {};
            \node[coordinate, below of = step 12, node distance = 2.5cm] (empty 5) {};
            \node[coordinate, left of = step 7,   node distance = 2.5cm] (empty 6) {};
            
            \path [arrow] (step 1) -- (step 2);
            \path [arrow] (step 2) -- (step 3);
            \path [arrow] (step 3) -- (step 4);
            \path [arrow] (step 4) -- (step 5);
            \path [arrow] (step 5) -- node [above, near start] {No} (step 17);
            \path [arrow] (step 5) -- node [left, near start] {Yes} (step 9);
            
            %edit field
            \path [arrow] (step 17) -- node [above, near start] {No} (step 6);
            \path [arrow] (step 17) -- node [left, near start] {Yes} (step 18);
            \path [line, rounded corners] (step 18) -| (empty 6);
            \path [arrow, rounded corners] (empty 6) |- (step 4);
            
            \path [arrow] (step 6) -- node [above, near start] {No} (step 7);
            \path [arrow] (step 6) -- node [left, near start] {Yes} (step 8);
            \path [arrow, rounded corners] (step 7) |- (step 4);
            \path [arrow, rounded corners] (step 8) -| (step 7);
            
            
            %buttons
            \path [arrow] (step 9) -- node [above, near start] {Yes} (step 13);
            \path [arrow] (step 9) -- node [left, near start] {No} (step 10);
            \path [arrow] (step 10) -- node [above, near start] {Yes} (step 14);
            \path [arrow] (step 10) -- node [left, near start] {No} (step 11);
            \path [arrow] (step 11) -- node [above, near start] {Yes} (step 15);
            \path [arrow] (step 11) -- node [left, near start] {No} (step 12);
            \path [arrow] (step 12) -- node [above, near start] {Yes} (step 16);
            \path [line] (step 12) -- node [left, near start] {No} (empty 5);
            \path [arrow, rounded corners] (empty 1) |- (step 4);
            
            \path [line] (step 13) -- (empty 1);
            \path [line] (step 14) -| (empty 2);
            \path [line] (empty 2) -| (empty 1);
            \path [line] (step 15) -| (empty 3);
            \path [line] (empty 3) -| (empty 2);
            \path [line] (step 16) -| (empty 4);
            \path [line] (empty 4) -| (empty 3);
            \path [line, rounded corners] (empty 5) -| (empty 4);
            \end{tikzpicture}
        }
        \caption{Flow chart of GUI interactivity}
        \label{fig:my_label}
    \end{figure}
    
    \newpage
    \begin{figure}
        \centering
       \scalebox{0.8}[0.8]{
            \begin{tikzpicture}[node distance = 1.5cm, auto]
                 \node[rect, rounded corners] (step 1) {start};
                 \node[rect, below of = step 1] (step 2) {Initiate (open) serial port};
                 
                 \node[diam, below of = step 2, node distance = 3.5cm] (step 3) {Send serial user data?};
                 \node[rect, right of = step 3, node distance = 3.5cm] (step 4) {Serial send value of edit field};
                 \node[diam, below of = step 3, node distance = 3.5cm] (step 5) {Measure- ment?};
                 \node[rect, right of = step 5, node distance = 3.5cm] (step 6) {Serial send "M"};
                 \node[diam, below of = step 5, node distance = 3.5cm] (step 7) {Localize?};
                 \node[rect, right of = step 7, node distance = 3.5cm] (step 8) {Serial send "C"};
                 \node[diam, below of = step 7, node distance = 3.5cm] (step 9) {Test?};
                 \node[rect, right of = step 9, node distance = 3.5cm] (step 10) {Serial send "T"};
                 
                 \node[rect, right of = step 10, node distance = 3.5cm] (step 11) {Read serial data};
                 \node [rect, below of = step 11, node distance = 2cm] (step 12) {Wait 0.1s};
                 \node[rect, below of = step 9, node distance = 3.5cm] (step 13) {Close serial port};
                 \node[rect, below of = step 13] (step 14) {Return};
                 
                \path [arrow] (step 1) -- (step 2);
                \path [arrow] (step 2) -- (step 3);
                \path [arrow] (step 3) -- node [left, near start] {No} (step 5);
                \path [arrow] (step 3) -- node [above, near start] {Yes} (step 4);
                \path [arrow] (step 5) -- node [left, near start] {No} (step 7);
                \path [arrow] (step 5) -- node [above, near start] {Yes} (step 6);
                \path [arrow] (step 7) -- node [left, near start] {No} (step 9);
                \path [arrow] (step 7) -- node [above, near start] {Yes} (step 8);
                \path [arrow] (step 9) -- node [left, near start] {No} (step 13);
                \path [arrow] (step 9) -- node [above, near start] {Yes} (step 10);
                
                \path [arrow, rounded corners] (step 4) -| (step 11);
                \path [arrow] (step 6) -| (step 11);
                \path [arrow] (step 8) -| (step 11);
                \path [arrow] (step 10) -- (step 11);
                \path [arrow] (step 11) -- (step 12);
                \path [arrow, rounded corners] (step 12) |- (step 13);
                \path [arrow] (step 13) -- (step 14);
            \end{tikzpicture}
        }
        \caption{Flow chart of start test command}
        \label{fig:my_label}
    \end{figure}
\end{document}

```
