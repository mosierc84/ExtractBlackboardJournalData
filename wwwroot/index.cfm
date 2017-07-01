<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Blackboard XML Parser</title>
</head>

<body>

<!--- this is where you specify the path to your Blackboard XML File --->
<cfset mydoc = XmlParse(ExpandPath("./data/NameOfYourBlackboardXMLFileHere.xml")) />
<cfset xmlString = toString(mydoc)/>

<table border="1">
<tr>
    <th>GUID</th>
    <th>Title</th>
    <th>Description</th>
    <th>Creator (student) ID</th>
    <th>Creation Date</th>
    <th>Last Edit Date</th>
    <th>Status</th>
    
<cfloop 
	from="1"
	to="#arrayLen(mydoc.BLOG.ENTRIES.ENTRY)#"
    index="i">

	<cfoutput>
	<!--- this regular expression cleans up any MS Word meta data or HTML tags from the XML data --->
    <cfset CleanDescription = REReplaceNoCase(mydoc.BLOG.ENTRIES.ENTRY[i].DESCRIPTION.TEXT.xmlText, '<[^>]*(?:>|$)', '','ALL')>
    <tr>
		<td>#mydoc.BLOG.ENTRIES.ENTRY[i].XmlAttributes.id#</td>
		<td>#mydoc.BLOG.ENTRIES.ENTRY[i].TITLE.XmlAttributes.value#</td>
		<td>#CleanDescription#</td>
        <td>#mydoc.BLOG.ENTRIES.ENTRY[i].CREATOR_ID.XmlAttributes.value#</td>
        <td>#mydoc.BLOG.ENTRIES.ENTRY[i].CREATION_DATE.XmlAttributes.value#</td>
        <td>#mydoc.BLOG.ENTRIES.ENTRY[i].LAST_EDIT_DATE.XmlAttributes.value#</td>
        <td>#mydoc.BLOG.ENTRIES.ENTRY[i].STATUS.XmlAttributes.value#</td>
    </tr>
	</cfoutput>

</cfloop>
</table>

</body>
</html>