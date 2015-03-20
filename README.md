# AAPB CSV 2 PREMIS

## Objective

This project is prepared in order to support translating one row csv files into PREMIS XML. The one line csv referenced is an internal data exchange format of the American Archive of Public Broadcasting. It is not anticipating that this repository is widely useful to any other project.

## Dependencies

This process depends on [ffe](http://ff-extractor.sourceforge.net/) (aka flat file extractor) and [xsltproc](http://xmlsoft.org/XSLT/xsltproc.html) though certainly other similar tools could be substituted.

## How To

The following code block will perform three commands. Firstly ffe transforms an input one row csv file into an xml form. An ffe configuration file (aapbcsv2premisevent.fferc) defines how that xml output shall be designed.

```
ffe -c aapbcsv2premisevent.fferc sample.csv -o /tmp/xml.xml
xsltproc aapbcsv2premis.xsl /tmp/xml.xml > sample.xml
xmllint --noout --schema premis-v2-0.xsd sample.xml
```

# To do

Validate the input csv to ensure that it meets the anticipated specifications. It is anticipated that the input csv is one row of 51 columns. Columns 8, 12, 14, 17, 19, 21, 23, 26, 28 must be either null or a date in mm/dd/yyyy format. The xsl will then convert it to an ISO 8601 date expression as required by PREMIS.