# Web Development Bits

### Javascript Functions

Used on a Microsoft RDWAPage to load third-party stylesheets and set placeholders

```javascript
function loadjscssfile(filename, filetype){
    if (filetype=="js"){ //if filename is a external JavaScript file
        var fileref=document.createElement('script')
        fileref.setAttribute("type","text/javascript")
        fileref.setAttribute("src", filename)
    }
    else if (filetype=="css"){ //if filename is an external CSS file
        var fileref=document.createElement("link")
        fileref.setAttribute("rel", "stylesheet")
        fileref.setAttribute("type", "text/css")
        fileref.setAttribute("href", filename)
    }
    if (typeof fileref!="undefined")
        document.getElementsByTagName("head")[0].appendChild(fileref)
}
function bodyLoad()
{
  document.getElementById("DomainUserName").placeholder = "Example: Domain\\username";
  loadjscssfile("https://fonts.googleapis.com/css?family=Roboto|Roboto+Slab", "css") ////dynamically load and add this .css file
}
```
