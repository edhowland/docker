# template_pdf.sh - call wkhtmltopdf.sh with args for template.html ...

html=$1
pdf=$2

./wkpdf.sh --user-style-sheet page.css --custom-header header.html $html $pdf
