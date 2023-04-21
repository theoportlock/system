set +H
echo "" > presentation.md
for i in *.svg
do
	echo "#" "${i%.*}" >> presentation.md
	printf "![]($(readlink -f $i))\n" >> presentation.md
	echo "" >> presentation.md
done
