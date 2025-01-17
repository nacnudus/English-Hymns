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
      \line {\caps{down ampney} 6 6 11 D}
    }
    \column{
      \line {Ralph Vaughan Williams 1872&ndash;1958}
      % \line {\italic "The English Hymnal," 1906}
      \vspace #0.5
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Italian, \caps{Bianco da Siena} d 1434}
      \line {\italic{Tr} \caps{R. F. Littledale} 1867}
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
  \key d \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  d2 e4 fs |
  a2 b |
  a1 \bar "||"

  a2 b4 a |
  d( cs) b2 |
  a2 \bar "||" \break

  a2 |
  b4 a g fs |
  e d e fs8[ g] |
  e2 d^\fermata \bar "||"

  d'2 cs4 b | \break
  a2 b |
  a1 \bar "||"

  c2 b4 a |
  g2 fs |
  e \bar "||"

  e2 | \break
  a4 b a g |
  fs d e fs8[ g] |
  e2 d^\fermata \bar "||"
}

alto = \relative c' {
  \global
  a2 a4 d |
  d( cs) b( cs) |
  d1 \bar "||"

  fs2 fs4 e |
  d( e) d2 |
  cs \bar "||"

  d2 |
  d4 cs d d |
  b d d d |
  d( cs) d2 \bar "||"

  fs2 fs4 d |
  fs2 e4( d) |
  cs1 \bar "||"

  e2 d4 d |
  b( cs) d2 |
  a2 \bar "||"

  cs |
  d4 d cs d8[ e] |
  a,4 d d d |
  d( cs) d2 \bar "||"
}

tenor = \relative c {
  \global
  fs2 a4 d, |
  e2 g4( e) |
  fs1 |
  a2 d,4 e |
  fs( a) a( gs) |
  a2 \bar "||"

  fs2 |
  g4 e g a |
  g a b b |
  a4.( g8) fs2 \bar "||"

  b2 a4 b |
  d( cs) b2 |
  cs1 \bar "||"

  g4( a) b fs |
  g2 a4( b) |
  cs2 \bar "||"

  a2 |
  a4 g e b' |
  a a b g |
  a4.( g8) fs2 \bar "||"
}

bass = \relative c {
  \global
  d2 cs4 d |
  a2 g |
  d'1 \bar "||"

  d2 d4 cs |
  b( cs) e2 |
  a,2 \bar "||"

  d2 |
  g,4 a b d |
  g fs g e |
  a,2 d_\fermata \bar "||"

  b' fs4 g |
  d( fs) gs2 |
  a1 \bar "||"

  e4( fs) g d |
  e2 fs4( g) |
  a2_\fermata \bar "||"

  a,4( g) |
  fs g a d8[ cs] |
  d4 fs g e |
  a,2 d_\fermata \bar "||"
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
