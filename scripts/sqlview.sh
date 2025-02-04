db=$1
out=$2
schemacrawler \
	--server=sqlite \
	--database=$db \
	--command=schema \
	--output-format=pdf \
	--info-level=standard \
	--output-file=$out
