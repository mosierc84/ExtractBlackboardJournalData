# ExtractBlackboardJournalData
Method/code to parse Blackboard journal entries embedded in an archived XML data file (Blackboard course archive data file). Export the student journal entries into an Excel file.

A faculty member requested to extract student journal entries from Blackboard. After contacting Blackboard support and researching online, we were unable to find a simple solution to this issue. This repository is our method to retrieve this data by parsing Blackboard data files found in the course archive. Special thanks to Ling Chen of St. Edwards University who found the journal entries embedded in an archived XML data file.

Getting the XML file of student journal entries
1. Archive your Blackboard course
2. Open the zip file of the archive
3. Look for the data file "res00013.dat" (this might be a different file name for you)
Once the XML file is identified, the data can be parsed. I wrote a quick XML parser in the ColdFusion markup language to extract the XML, strip out the HTML tags(via a regular expression) and organize the data into an HTML table. That HTML table can then be copied and pasted into an excel file. There are likely more elegant solutions (via C, PHP or VB), but CFML was handy for us.
4. Parsing the XML file into Excel

Using ColdFusion code to parse your own XML file.
1. Download a copy of ColdFusion server (free single seat license called a Developers License).
2. Copy the “index.cfm” and the data folder to the wwwroot folder.
3. Move the "res00013.dat file into the "data" folder and change the file extension from ".dat" to ".xml"
4. change the data referenced in the <CFSET> tag to your XML file path.
5. load the index.cfm page in your web browser.
6. copy the HTML output into a blank Excel file.

Included is the XML DOM for the Blackboard student journal file.
