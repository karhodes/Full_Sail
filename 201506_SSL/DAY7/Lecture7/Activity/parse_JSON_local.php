<?

// Name:  Kelly Rhodes
// Server Side Languages
// June 15, 2015
//
// API (XML - JSON)
// Applicaiton programming interfaces.  This is how one application can talk to another.
// Facebook, Ebay, Amazon, Google, etc...

// Parse a JSON file from a local file

$contents = file_get_contents("myjson.json");

$encoded = json_decode($contents);		// use decode to convert JSON object to string

foreach($encoded->feeds as $feed){		// loop through content of file above

	echo $feed->from."</br>";			// only echo out "from" node

}

?>