#/bin/sh

# do a leading-zero filename change for images 1.jpg through 9.jpg
# for i in 1.jpg 2.jpg 3.jpg 4.jpg 5.jpg 6.jpg 7.jpg 8.jpg 9.jpg;
# do
#     echo "Renaming $i to 0${i/.jpg}.jpg"
#     mv "$i" "0${i/.jpg}".jpg;
# done
#
#
# # do a leading zero filename change for images like ??.jpg
# for i in ??.jpg;
# do
#     echo "Renaming $i to 0${i/.jpg}.jpg"
#     mv "$i" "0${i/.jpg}".jpg;
# done

# build a nice little lightbox page for all the images in a directory
# expect thumbnails in a thumbnail directory coming from imageindex
# expect mediums in a medium directory coming from imageindex

imageindex -norecurse -noslide -nodetail -nodirs -nomontage;



# (web-accessible) path to the lightbox script
# remember that we modified the lightbox to better do the viewport bits inside the window.InnerHeight and stuff
LBPATH="./";

# MAXHEIGHT="700";
# MAXWIDTH="900";

# use the directory we're in as the name of the lightbox group.
# variable representing the directory
MYDIR=${PWD##*/};

echo "<html>" > lb.html;
echo "<head>" >> lb.html;
echo "<link rel=\"stylesheet\" href=\"$LBPATH/lightbox2-master/dist/css/lightbox.min.css\">" >> lb.html;

echo "</head>" >> lb.html;
echo "<body>" >> lb.html;

for i in *.jpg;
do
    echo "processing $i";
    echo "<div style=\"display: inline-block; margin: 0.5em;\"><a class=\"\" href=\"medium/$i\" data-lightbox=\"$MYDIR\" data-title=\"$MYDIR &rarr; $i\"><img class=\"example-image\" src=\"thumbnail/$i\" alt=\"\"/></a><br/><a href=\"$i\">$i</a></div>" >> lb.html;
done

echo "<script src=\"$LBPATH/lightbox2-master/dist/js/lightbox-plus-jquery.js\"></script>" >> lb.html;

echo "<script>
    lightbox.option({
      'fitImagesInViewport': true ,
      'showImageNumberLabel': true /*,
      'maxHeight': $MAXHEIGHT ,
      'maxWidth': $MAXWIDTH */
    })
</script>" >> lb.html;

echo "</body>" >> lb.html;
echo "</html>" >> lb.html;
mv lb.html index.html;
