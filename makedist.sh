cd book
cp modelling-slidessol.tex modelling.tex
cp modelling-slidessol.tex modelling-slides.tex

# Process all the latex files in parallel
latexmk -pdf -latexoption="-interaction nonstopmode -halt-on-error -file-line-error" modelling-slidessol &
latexmk -pdf -latexoption="-interaction nonstopmode -halt-on-error -file-line-error" modelling-slides &
latexmk -pdf -latexoption="-interaction nonstopmode -halt-on-error -file-line-error" modelling &

# Wait until all the files are processed
wait $(jobs -p)

mv *.pdf ../dist/

latexmk -c modelling &
latexmk -c modelling-slides &
latexmk -c modelling-slidessol &


