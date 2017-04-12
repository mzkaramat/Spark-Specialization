 import org.apache.spark.rdd.RDD
 
 case class WikipediaArticle(title: String, text: String) {
  /**
    * @return Whether the text of this article mentions `lang` or not
    * @param lang Language to look for (e.g. "Scala")
    */
  def mentionsLanguage(lang: String): Boolean = text.split(' ').contains(lang)
}
  
 def parse(line: String): WikipediaArticle = {
    val subs = "</title><text>"
    val i = line.indexOf(subs)
    val title = line.substring(14, i)
    val text  = line.substring(i + subs.length, line.length-16)
    WikipediaArticle(title, text)
  }


val wikiRdd: RDD[WikipediaArticle] = sc.textFile("file:/mnt/home/muhammadzeeshan0/realLifeExample/wikipedia.dat").map(element=>parse(element) )


wikiRdd.filter(doc=>doc.text.contains("PHP")).count

for (i <- 1 to langs.size-1){
	println(langs(i))
}