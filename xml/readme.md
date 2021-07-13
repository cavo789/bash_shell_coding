# Working with XML content

## Using xmlstarlet, make sure it's installed

```bash
#!/bin/sh

if [ -z $(which xmlstarlet) ]; then
    # xmlstarlet not yet installed, install it
    printf "\n\033[0;36mInstall xmlstarlet\033[0m\n"
    sudo apt-get update && sudo apt-get -y install xmlstarlet
fi
```

## XPath

Source:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<bookstore>
    <book category="cooking">
        <title lang="en">Everyday Italian</title>
        <author>Giada De Laurentiis</author>
        <year>2005</year>
        <price>30.00</price>
    </book>
    <book category="children">
        <title lang="en">Harry Potter</title>
        <author>J K. Rowling</author>
        <year>2005</year>
        <price>29.99</price>
    </book>
    <book category="web">
        <title lang="en">XQuery Kick Start</title>
        <author>James McGovern</author>
        <author>Per Bothner</author>
        <author>Kurt Cagle</author>
        <author>James Linn</author>
        <author>Vaidyanathan Nagarajan</author>
        <year>2003</year>
        <price>49.99</price>
    </book>
    <book category="web">
        <title lang="en">Learning XML</title>
        <author>Erik T. Ray</author>
        <year>2003</year>
        <price>39.95</price>
    </book>
</bookstore>
```

### Get the list of titles

```bash
cat "data.xml" | xmlstarlet sel -t -v "/bookstore/book/title"
```

Output:

```txt
Everyday Italian
Harry Potter
XQuery Kick Start
Learning XML
```

### Get the list of titles when the category is children

```bash
cat "data.xml" | xmlstarlet sel -t -v "//book[@category='children']/title"
```

Output:

```txt
Harry Potter
```
