================= Hello World ================
curl -X MKCOL http://localhost:8080/apps/thoughtworks -u admin:admin


curl -X MKCOL http://localhost:8080/etc/ -u admin:admin
curl -X MKCOL http://localhost:8080/etc/design -u admin:admin
curl -X MKCOL http://localhost:8080/etc/design/css/ -u admin:admin
curl -X MKCOL http://localhost:8080/etc/design/js/ -u admin:admin
curl -u admin:admin -T bootstrap.min.css http://localhost:8080/etc/design/css/bootstrap.min.css
curl -u admin:admin -T bootstrap.min.js http://localhost:8080/etc/design/js/bootstrap.min.js


curl -X MKCOL http://localhost:8080/apps/thoughtworks/images/ -u admin:admin
curl -u admin:admin -T png.esp http://localhost:8080/apps/thoughtworks/images/png.esp
curl -u admin:admin -T small.png.esp http://localhost:8080/apps/thoughtworks/images/small.png.esp

touch header.esp  

curl -u admin:admin -T header.esp http://localhost:8080/apps/thoughtworks/header/html.esp

-F"sling:resourceType=thoughtworks/header"

================= Image ================

## Component:
curl -u admin:admin -T png.esp http://localhost:8080/apps/thoughtworks/images/GET.esp 

## Content
curl -u admin:admin -F"sling:resourceType=thoughtworks/images" -T l.png http://localhost:8080/content/hw/l.png
curl -u admin:admin -T m.png http://localhost:8080/content/hw/m.png
curl -u admin:admin -T l.png http://localhost:8080/content/hw/l.png



================= Articles ================
## Component:
curl -X MKCOL http://localhost:8080/apps/thoughtworks/article/ -u admin:admin
curl -u admin:admin -T article.esp http://localhost:8080/apps/thoughtworks/article/html.esp

## Content:
curl -X -F"sling:resourceType=thoughtworks/article" http://localhost:8080/content/article/ -u admin:admin
curl -F"desc=3st-article" -F"jcr:primaryType=nt:unstructured" http://localhost:8080/content/article/03 -u admin:admin
curl -F"desc=4nd-article" -F"jcr:primaryType=nt:unstructured" http://localhost:8080/content/article/04 -u admin:admin


================= Grid Template ================
## Components:

### button:
curl -X MKCOL http://localhost:8080/apps/thoughtworks/button/ -u admin:admin
curl -u admin:admin -T button.esp http://localhost:8080/apps/thoughtworks/button/html.esp
curl -u admin:admin -T button.editor.esp http://localhost:8080/apps/thoughtworks/button/editor.html.esp

### cols:
curl -X MKCOL http://localhost:8080/apps/thoughtworks/cols2/ -u admin:admin
curl -u admin:admin -T cols2.esp http://localhost:8080/apps/thoughtworks/cols2/html.esp

### col:
curl -X MKCOL http://localhost:8080/apps/thoughtworks/col/ -u admin:admin
curl -u admin:admin -T col.esp http://localhost:8080/apps/thoughtworks/col/html.esp
curl -u admin:admin -T col.editor.esp http://localhost:8080/apps/thoughtworks/col/editor.html.esp

## Content:

### Page
curl -F"sling:resourceType=thoughtworks/cols2" http://localhost:8080/content/grids -u admin:admin

### Columns
curl -F"sling:resourceType=thoughtworks/col" http://localhost:8080/content/grids/left -u admin:admin
curl -F"sling:resourceType=thoughtworks/col" http://localhost:8080/content/grids/right -u admin:admin

### Buttons
curl -F"sling:resourceType=thoughtworks/button" -F"text=www" http://localhost:8080/content/grids/left/button1 -u admin:admin
curl -F"sling:resourceType=thoughtworks/button" -F"text=www" http://localhost:8080/content/grids/left/button2 -u admin:admin
curl -F"sling:resourceType=thoughtworks/button" -F"text=www" http://localhost:8080/content/grids/right/button1 -u admin:admin
curl -F"sling:resourceType=thoughtworks/button" -F"text=www" http://localhost:8080/content/grids/right/button2 -u admin:admin

================= Inherit Template ================
## Base
curl -X MKCOL http://localhost:8080/apps/thoughtworks/base/ -u admin:admin
curl -u admin:admin -T base.esp http://localhost:8080/apps/thoughtworks/base/GET.esp
curl -u admin:admin -T header.esp http://localhost:8080/apps/thoughtworks/base/header.esp
curl -u admin:admin -T footer.esp http://localhost:8080/apps/thoughtworks/base/footer.esp

## Template 1
curl -F"jcr:primaryType=nt:unstructured" -F"sling:resourceSuperType=thoughtworks/base"  http://localhost:8080/apps/thoughtworks/tpl1 -u admin:admin
curl -u admin:admin -T header-1.esp http://localhost:8080/apps/thoughtworks/tpl1/header.esp


## Template 2
curl -F"sling:resourceSuperType=thoughtworks/base" -F"jcr:primaryType=nt:unstructured" http://localhost:8080/apps/thoughtworks/tpl2 -u admin:admin
curl -u admin:admin -T footer-2.esp http://localhost:8080/apps/thoughtworks/tpl2/footer.esp


## Template 3

curl -F"sling:resourceSuperType=thoughtworks/tpl2" -F"jcr:primaryType=nt:unstructured" http://localhost:8080/apps/thoughtworks/tpl3 -u admin:admin

## Content
curl -F"sling:resourceType=thoughtworks/tpl1" http://localhost:8080/content/page1 -u admin:admin
curl -F"sling:resourceType=thoughtworks/tpl2" http://localhost:8080/content/page2 -u admin:admin

curl -F"sling:resourceType=thoughtworks/tpl3" http://localhost:8080/content/page3 -u admin:admin

================= Home Page ================
## JCR默认支持的数据类型
http://jackrabbit.apache.org/jcr/node-type-notation.html
http://jackrabbit.apache.org/jcr/node-type-visualization.html
## Sling默认支持的数据类型
Sling defines a number of JCR node types, primarily in the jcr.resource bundle.
sling:Resource
sling:ResourceSuperType
sling:Folder
sling:HierarchyNode
sling:OrderedFolder
sling:ResourceAlias
sling:MappingSpec
sling:Mapping
sling:Redirect
sling:VanityPath


