%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.18.2"
\include "english.ly"
\include "util.ly"
\include "../hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {\caps{dominus regit me 87 87}}
    }
    \column{
      \line {J. B. Dykes 1823&ndash;76}
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
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4 b'4 |
  d c b b |
  a a g \breathe d |
  d4. e8 fs4 g |
  \partial 2. b2 a4 \bar "||" \break

  \partial 4 d4 |
  c b8[ a] b4 b |
  a g8[ fs] g4 \breathe e |
  d4. e8 fs4 g |
  \partial 2. b( a) g^\fermata \bar "||"
}

alto = \relative c' {
  \global
  d4 |
  fs e d g |
  g fs e d |
  d4. d8 cs4 cs |
  d( g) fs \bar "||"

  g4 |
  g fs g e |
  e ds e b8[ c] |
  c4. c8 c4 d |
  \partial 2. fs2 g4 \bar "||"
}

tenor = \relative c {
  \global
  b'4 |
  a g8[ a] b4 d |
  c8[ b] c4 b a8[ c] |
  c4 b a g |
  g4.( b8) d4 \bar "||"

  d4 |
  e d d b |
  c b b g |
  fs4. g8 a4 b |
  c2 b4 \bar "||"
}

bass = \relative c {
  \global
  g'4 |
  d e8[ fs] g4 b,8[ c] |
  d4 d e fs |
  g g e e |
  d2 d4 \bar "||"

  b'4 |
  a d, g g |
  fs b, e e8[ c] |
  d4. d8 d4 d |
  d2 g4_\fermata \bar "||"
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
