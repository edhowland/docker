# dowk.sh - calls wkhtmltopdf with right options
wkhtmltopdf --user-style-sheet page.css --header-html file:///home/vagrant/src/docker/reports/header.html --header-line $@
# --print-media-type  --header-spacing 3 



