\version "2.18.2"

%%%%%%%%%%%%%%%%%%%%

%setting the global staff size in a variable placed inside the book block seems to do nothing
#(set-global-staff-size 16)

%%%%%%%%%%%%%%%%%%%%

\paper {
  #(set-paper-size "a5")
  #(include-special-characters)
  #(define fonts
    (make-pango-font-tree "Gentium Plus"
                          "Nimbus Sans"
                          "Luxi Mono"
                          (/ staff-height pt 20)))
  page-count = #1
	%#(set-paper-size "ustrade")
	top-margin = 0.5\in
	bottom-margin = 0.5\in
	left-margin = 0.5\in
	right-margin = 0.5\in

}

