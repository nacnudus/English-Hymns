%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.18.2"
\include "english.ly"
\include "../hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {\caps{wolvercote 76 76 d}}
    }
    \column{
      \line {William H. Ferguson 1874&ndash;1950}
      \vspace #0.5
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key d \major
  \time 4/2
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 2 e2 |
  a d cs b4( cs) |
  a2( fs) e cs4( d) |
  e2 cs' b4( a) b2 |
  a1. \bar "||"  \break

  \partial 2 e2 |
  a d cs b4( cs) |
  a2( fs) e cs4( ds) |
  e2 fs gs4( a) fs2 |
  e1. \bar "||" \break

  \partial 2 e2 |
  c'2 b a e4( fs) |
  g2.( a4) g2 e4( d) |
  c2 c' b b |
  b1. \bar "||" \break

  \partial 2 e,2 |
  a d cs b4( cs) |
  a2( fs) e cs4( d) |
  e2 cs' b4( a) b2 |
  \partial 1. a1. \bar "||"
}

\book {
  \include "../hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
  \score {
      \new Staff  <<
        \melody
      >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 88 4)
      }
    }
    \include "../hymn_layout.ly"
  }
  %\bottom
}

