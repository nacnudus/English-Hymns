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
      \line {\caps{nottingham} 77 77}
    }
    \column{
      \line {Wenzel Müller 1747&ndash;1835}
      % \line {\italic "The English Hymnal," 1906}
      \vspace #0.5
    }
  }
}

\header {
  tagline = ""
}

breathmark = {
  \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
  \override Score.RehearsalMark #'Y-offset = #'4.0
  \override Score.RehearsalMark #'X-offset = #'-0.5
  \mark \markup { \fontsize #4 ","}
}


global = {
  \key g \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  g'2 g4 |
  fs2 d4 |
  c'2 c4 |
  b2. \bar "||"

  d2 b4 |
  d( c) a | \break
  g2 b4 |
  a2. \bar "||"

  g2 g4 |
  fs4.( e8) d4 |
  c'2 c4 |  \break
  b2. \bar "||"

  d2 b4 |
  a( c) e |
  g,2 fs4 |
  g2. \bar "||"
}

alto = \relative c' {
  \global
  d2 d4 |
  d2 d4 |
  d2 fs4 |
  g2. \bar "||"

  g2 g4 |
  e2 d4 |
  d2 g4 |
  fs2. \bar "||"

  g2 g4 |
  fs4.( e8) d4 |
  d2 fs4 |
  g2. \bar "||"

  d4( g) f |
  e2 e4 |
  d2 c4 |
  b2. \bar "||"
}

tenor = \relative c {
  \global
  b'2 b4 |
  a2 fs4 |
  fs4( a) d |
  d2. \bar "||"

  d4( b) b |
  a2 c4 |
  b2 d4 |
  d2. \bar "||"

  b4( d) b |
  c4.( b8) a[ g] |
  fs4( a) d |
  d2. \bar "||"

  b2 d4 |
  c2 a4 |
  b2 a4 |
  g2. \bar "||"
}

bass = \relative c {
  \global
  g'2 g4 |
  d2 d4 |
  d4( fs) d |
  g2. \bar "||"

  b4( g) g |
  a2 fs4 |
  g4( b) g |
  d2. \bar "||"

  g4( b) g |
  a4.( g8) fs[ e] |
  d4( fs4) d4 |
  g2. \bar "||"

  g2 gs4 |
  a2 c,4 |
  d2 d4 |
  g2. \bar "||"
}

\book {
  \include "../hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
  \score {
    \new StaffGroup <<
      \set StaffGroup.systemStartDelimiter = #'SystemStartBar
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 88 4)
      }
    }
    \include "../hymn_layout.ly"
  }
}
