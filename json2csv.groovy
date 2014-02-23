import groovy.json.*
def input=new File('/tmp/http.json').text
def json=new JsonSlurper().parseText(input)

if(json.data.size > 0) {

	def output=new File('/tmp/groovy.csv')
	json.data.each {
		def row = [it.id, it.updated_time, '"'+it.message.replaceAll('"','""').replaceAll('\n',' ')+'"' ]
		output.append row.join(',') + '\n'
	}

	next = json.paging.next.replaceAll('&','%str(&)');
println "NEXT: "+next
	exports.put('topull',next)
}
else {
println "NO NEXT FOUND"
	exports.put('topull','')
}