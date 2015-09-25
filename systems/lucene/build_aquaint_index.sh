source ../common.sh
echo "Compiling ingester project..."
cd ingester
export JAVA_HOME=/usr/
mvn clean compile assembly:single
cd ..

echo "Starting indexing..."
rm -rf /scratch0/indexes/aquaint

# Counts index
java -cp lib/lucene-core-5.2.1.jar:lib/lucene-backward-codecs-5.2.1.jar:lib/lucene-analyzers-common-5.2.1.jar:lib/lucene-benchmark-5.2.1.jar:lib/lucene-queryparser-5.2.1.jar:.:ingester/target/ingester-0.0.1-SNAPSHOT-jar-with-dependencies.jar luceneingester.TrecIngester -dataDir $AQUAINT_LOCATION -indexPath /scratch0/indexes/aquaint/cnt -threadCount 32 -docCountLimit -1 

# Positional index
java -cp lib/lucene-core-5.2.1.jar:lib/lucene-backward-codecs-5.2.1.jar:lib/lucene-analyzers-common-5.2.1.jar:lib/lucene-benchmark-5.2.1.jar:lib/lucene-queryparser-5.2.1.jar:.:ingester/target/ingester-0.0.1-SNAPSHOT-jar-with-dependencies.jar luceneingester.TrecIngester -dataDir $AQUAINT_LOCATION -indexPath /scratch0/indexes/aquaint/pos -positions -threadCount 32 -docCountLimit -1 

for index in "cnt" "pos"
do
	echo "Evaluation index ${index}"
	for queries in "aquaint"
	do
		query_file=$TOPICS_QRELS/topics.${queries}.txt
		qrel_file=$TOPICS_QRELS/qrels.${queries}.txt
		run_file=submission_${queries}_${index}.txt
		stat_file=submission_${queries}_${index}.log
		eval_file=submission_${queries}_${index}.eval

		java -cp lib/lucene-core-5.2.1.jar:lib/lucene-backward-codecs-5.2.1.jar:lib/lucene-analyzers-common-5.2.1.jar:lib/lucene-benchmark-5.2.1.jar:lib/lucene-queryparser-5.2.1.jar:.:ingester/target/ingester-0.0.1-SNAPSHOT-jar-with-dependencies.jar luceneingester.TrecDriver ${query_file} ${qrel_file} ${run_file} /scratch1/indexes/aquaint/${index}/index T > ${stat_file}

		${TREC_EVAL} ${qrel_file} ${run_file} > ${eval_file}
	done
done
