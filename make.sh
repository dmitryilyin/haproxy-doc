cd tex

pdflatex configuration.tex
makeindex configuration.idx
pdflatex configuration.tex

pdflatex architecture_guide.tex
makeindex architecture_guide.idx
pdflatex architecture_guide.tex

mv configuration.pdf ..
mv architecture_guide.pdf ..
cd ..
